
 // SPDX-License-Identifier: MIT
 pragma solidity ^0.8.28;

 import "@openzeppelin/contracts/access/Ownable.sol";

 contract Traceability is Ownable {
     enum Status { UNKNOWN, GOOD, HOLD, RECALL, DESTROY }

     struct TxRecord {
         address shipper;
         address receiver;
         string cid; // IPFS CID (encrypted payload)
         Status status;
         uint256 timestamp;
     }

     mapping(bytes32 => TxRecord) public records;

     event TxCreated(bytes32 indexed txId, address indexed shipper, address indexed receiver, string cid);
     event StatusUpdated(bytes32 indexed txId, Status newStatus, address indexed updater);

     function createRecord(
         bytes32 txId,
         address shipper,
         address receiver,
         string calldata cid,
         uint256 timestamp
     ) external {
         require(bytes(records[txId].cid).length == 0, "tx exists");
         records[txId] = TxRecord({
             shipper: shipper,
             receiver: receiver,
             cid: cid,
             status: Status.UNKNOWN,
             timestamp: timestamp
         });
         emit TxCreated(txId, shipper, receiver, cid);
     }

     function updateStatus(bytes32 txId, Status newStatus) external {
         require(bytes(records[txId].cid).length != 0, "no tx");
         TxRecord storage r = records[txId];
         require(msg.sender == r.shipper || msg.sender == r.receiver || msg.sender == owner(), "not authorized");
         r.status = newStatus;
         emit StatusUpdated(txId, newStatus, msg.sender);
     }

     function getRecord(bytes32 txId) external view returns (
         address shipper,
         address receiver,
         string memory cid,
         Status status,
         uint256 timestamp
     ) {
         TxRecord storage r = records[txId];
         require(bytes(r.cid).length != 0, "no tx");
         return (r.shipper, r.receiver, r.cid, r.status, r.timestamp);
     }
 }
