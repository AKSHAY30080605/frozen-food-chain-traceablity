# Sample Hardhat 3 Beta Project (`node:test` and `viem`)

This project showcases a Hardhat 3 Beta project using the native Node.js test runner (`node:test`) and the `viem` library for Ethereum interactions.

To learn more about the Hardhat 3 Beta, please visit the [Getting Started guide](https://hardhat.org/docs/getting-started#getting-started-with-hardhat-3). To share your feedback, join our [Hardhat 3 Beta](https://hardhat.org/hardhat3-beta-telegram-group) Telegram group or [open an issue](https://github.com/NomicFoundation/hardhat/issues/new) in our GitHub issue tracker.

## Project Overview

This example project includes:

- A simple Hardhat configuration file.
- Foundry-compatible Solidity unit tests.
- TypeScript integration tests using [`node:test`](nodejs.org/api/test.html), the new Node.js native test runner, and [`viem`](https://viem.sh/).
- Examples demonstrating how to connect to different types of networks, including locally simulating OP mainnet.

## Usage

### Running Tests

To run all the tests in the project, execute the following command:

```shell
npx hardhat test
```

You can also selectively run the Solidity or `node:test` tests:

```shell
npx hardhat test solidity
# Frozen Food Supply Chain Traceability

Smart-contract-based traceability for a frozen food supply chain. This repository contains Solidity contracts, deployment scripts, example Ignition modules, tests, and a simple frontend scaffold to demonstrate tracking items through a supply chain on Ethereum-compatible networks using Hardhat.

**Key highlights**:
- Smart contracts: `contracts/Traceability.sol` (main traceability logic) and `contracts/Lock.sol` (example lock contract).
- Hardhat development environment with example scripts and tests.
- Ignition deployment modules under `ignition/modules/`.
- Frontend scaffold in `rich-trace-frontend/` to integrate with deployed contracts.

**Repository structure**
- `contracts/` — Solidity contracts (`Traceability.sol`, `Lock.sol`).
- `scripts/` — deployment and helper scripts (e.g., `deploy.js`).
- `ignition/modules/` — example Ignition modules for automated deployments (`Counter.ts`, `Lock.js`).
- `test/` — test files (JavaScript/TypeScript) demonstrating contract tests.
- `rich-trace-frontend/` — frontend application that can interact with the deployed contracts.

## Prerequisites
- Node.js (recommended LTS, e.g., 18+)
- npm or yarn
- `npx` (bundled with npm)

Optional for deployments to public testnets:
- An RPC provider URL (Alchemy, Infura, etc.)
- A funded account private key for the target network

Create a `.env` file or set environment variables for private keys and RPC endpoints. Example `.env` entries:

```
RPC_URL=<your_rpc_url>
PRIVATE_KEY=<your_deployer_private_key>
```

Adjust network names/keys in `hardhat.config.cjs` as needed.

## Quick start
1. Install dependencies:

```powershell
npm install
```

2. Compile contracts:

```powershell
npx hardhat compile
```

3. Run tests (Solidity + JS/TS tests):

```powershell
npx hardhat test
```

4. Deploy locally (Hardhat network):

```powershell
npx hardhat run scripts/deploy.js --network localhost
```

5. Deploy to a public testnet (example):

```powershell
npx hardhat run scripts/deploy.js --network sepolia
```

Note: Fill in RPC and `PRIVATE_KEY` values in your env or Hardhat config before deploying to a public network.

## Ignition modules
This repo includes Ignition modules in `ignition/modules/`. To run an Ignition module locally:

```powershell
npx hardhat ignition deploy ignition/modules/Counter.ts
```

To target a named network, add `--network <name>`.

## Contracts overview
- `Traceability.sol`: Implements the core supply-chain tracking features (events, item lifecycle updates, and role-based permissions). Review the contract source for full behavior.
- `Lock.sol`: Small example contract used in tests/ignition for demonstrating deployment and simple interactions.

## Frontend
The `rich-trace-frontend/` folder contains a basic frontend app to interact with the deployed contracts. Typical steps:

```powershell
cd rich-trace-frontend
npm install
npm start
```

Check that the frontend is configured to point at the correct contract addresses and RPC endpoints.

## Contributing
- Open issues or PRs for bugs, improvements, or new features.
- Run and extend tests when making contract changes.

## Security & auditing
- This example project is educational and **not** production-audited. Do not use these contracts with real funds or sensitive production workflows without a proper security review and audit.

## License
This project does not include an explicit license file. If you intend to open-source this project, add a `LICENSE` file (for example, MIT) and update this README accordingly.

---

If you want, I can also:
- Add a `.env.example` with recommended variables.
- Add a simple README inside `rich-trace-frontend/` showing how to configure it.
- Create a short contributing guide.

If you'd like those additions, tell me which one to add next.
