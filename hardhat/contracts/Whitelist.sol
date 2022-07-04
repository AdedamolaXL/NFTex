// SPDX-License-Identifier: Unlicendsed
pragma solidity ^0.8.0;

contract Whitelist {

  //Max num of whitelisted addresses allowed
  uint8 public maxWhitelistedAddresses;

  /**
  *Create a mapping of whitelistedAddresses
  *If an address is whitelisted, we set it to true, all other addresseses is set to false by default
  */
  mapping(address => bool) public whitelistedAddresses;

  /**numAddressesWhitelisted will keep track of how many addresses have been whitelisted
  *NOTE: Don't change this variable name, as it will be part of verification
  */
  uint8 public numAddressesesWhitelisted;

  //Setting the Max number of whitelisted addresses
  //User will put the value at the time of deployment
  constructor(uint8 _maxWhitelistedAddresses) {
    maxWhitelistedAddresses = _maxWhitelistedAddresses;
  }

  /**
  *addAddressToWhitelist - This function add s the address of the sender to the whitelist
  */
  function addAddressToWhitelist() public { 
    //Check if the user has already been whitelisted
    require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
    //Check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
    require(numAddressesesWhitelisted < maxWhitelistedAddresses, "More addresses can't be added, limit reached");
    // Add the address which called the function to the whitelistedAddress array
    whitelistedAddresses[msg.sender] = true;
    // Increase the number of whitelisted addresses
    numAddressesesWhitelisted +=1;
  }
  
}