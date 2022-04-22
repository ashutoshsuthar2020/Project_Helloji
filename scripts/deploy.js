const { ethers } = require("hardhat");

async function main() {
    const HelloJi = await ethers.getContractFactory("HelloJi");
 
    // Start deployment, returning a promise that resolves to a contract object
    const hello_ji = await HelloJi.deploy("Hello World!");
    console.log("Contract deployed to address:", hello_ji.address);}
 
 main()
   .then(() => process.exit(0))
   .catch(error => {
     console.error(error);
     process.exit(1);
   });