const hre = require("hardhat");

async function main() {
    const Traceability = await hre.ethers.getContractFactory("Traceability");

    // Deploy the contract
    const trace = await Traceability.deploy();

    // Wait for deployment to be mined (Ethers v6)
    await trace.waitForDeployment();

    console.log("Traceability deployed to:", trace.target);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});