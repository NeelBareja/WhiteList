// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Whitelist {
    // Max User
    uint8 public maxPeople;

    // mapping for users
    // if user is registered that true and and if not by default false
    mapping(address => bool) public peopleStatus;

    // track the registered users
    uint8 public listOfPeople;

    // setting up max people
    // needs to set before deployment
    constructor(uint8 _maxPeople) {
        maxPeople = _maxPeople;
    }

    // add people to Whitelist

    function addPeopleToWhitelist() public{
        // check is people is already Listed
        require(!peopleStatus[msg.sender], "Already Listed.");
        
        // check if there is space awailable or not.
        require(listOfPeople < maxPeople, "The space is full.");

        // add people
        peopleStatus[msg.sender] = true;

        // increace list of people
        listOfPeople += 1; 
    }

}

