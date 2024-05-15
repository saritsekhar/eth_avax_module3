const hre = require("hardhat");

async function main() {
  const mytoken = await hre.ethers.deployContract("sarit_Token");
  await mytoken.waitForDeployment();

  // Display the contract address
  console.log(`sarit_Token token deployed to ${mytoken.target}`);
}

// Hardhat recommends this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
