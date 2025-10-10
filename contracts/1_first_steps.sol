
// SPDX-License-Identifier: MIT

// Version
pragma solidity ^0.8.24;

// Import Openzepelin Smart Contract
import "@openzeppelin/contracts@5.4.0/token/ERC721/ERC721.sol";

// Smart Contract declaration
contract FirstContract is ERC721 {
    // Deploy address person
    address public owner;
    
    /* Storage owner variable the person address to deploy the contract */
    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
        owner = msg.sender;
    }
}

