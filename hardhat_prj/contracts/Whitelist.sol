// SPDX-License-Identifier: Unlicense


pragma solidity ^0.8.17;

contract Whitelist{

    // Declare a variable for max_addressses allowed in the whitelist
    uint8 public maxWhitelistedAddresses;

    // Create a mapping of the whitelistedAddresses;
    // If an address is whitelisted so we would set it to true
    // -> it is false by default for all other addresses

    mapping(address => bool) public whitelistedAddresses;

    // Declare a variable numAddressesWhitelisted to keep track of how many addresses have been whitlisted
    // Note : Don't change the variable name, because it will be part of verification
    uint8 public numAddressesWhitelisted;

    // Setting the maxWhitelistedAddresses;
    // We will put the value of the max during the deployment
    // Initiation of our smart contract in the constructor
    constructor (uint8 _maxWhitelistedAdresses) {
        maxWhitelistedAddresses = _maxWhitelistedAdresses;
    }

    // Function addAddressToWhitelist() : This is the function that adds 
    // the address of the sender to the whitelist

    function addAddressToWhitelist() public {
        // 1- First : check if the address has already been whitelisted
        //-> if the sender addresses is not set to true in the mapping continue,
        //   otherwise, return the message : "Sender has already been whitelisted"
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        // 2- Second : Check if the we are allowed to add the new address :
        // -> The numAddressesWhitelisted must be less than the mawWhitelistedAddresses
        //    if numAddressesWhitelisted < maxWhitelistedAddresses
        //    else return the error message "Can Add more addresses. Limit reached !"
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Can't add more addresses. Limit reached!");

        //3- If the above conditions are reached, we can add the new address to the whitelist
        //   And we must increment the numWhitelistedAddresses by 1
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;

    }

    function getNumWhitelistedAddresses() public view returns (uint8) {
        return numAddressesWhitelisted;
    }
}
