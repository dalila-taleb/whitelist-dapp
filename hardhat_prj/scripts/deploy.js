// Add comments later
//const ethers = require("hardhat");
//import { ethers } from "hardhat";

async function main() {

    /* 
    A ContractFactory in ethers is an abstraction used to deploy new smart contracts,,
    => whitelisteContract : is a factory for instances of our Whitelist contract.
    */
    const whitelistConract = await hre.ethers.getContractFactory("Whitelist");

    /* 
    Here we deploy  our contract
    10 : is the value for the maxWhitelistedAddresses, the max addresses allowed
    */
    const deployedWhitelistContract = await whitelistConract.deploy(10);

    //await for it to finish deploying
    await deployedWhitelistContract.deployed();

    // Then print the address of the deployed contract
    console.log("Whitelist Contract Address : ", deployedWhitelistContract.address);
}

// Here we call the main function and catch if there is any error
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });