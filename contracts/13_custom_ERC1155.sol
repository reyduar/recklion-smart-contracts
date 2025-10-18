// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Erc155Impl is ERC1155 {
    // variables 
    uint256 public constant GOLD = 0;
    uint256 public constant SILVER = 1;
    uint256 public constant THORS_HAMMER = 2;
    uint256 public constant SWORD = 3;
    uint256 public constant SHIELD = 4;

    // Constructor del Smart Contract
    constructor() ERC1155("https://game.example/api/item/{id}.json") {
        // forma sin bulk
        _mint(msg.sender, GOLD, 10**18, "");
        _mint(msg.sender, SILVER, 10**27, "");
        _mint(msg.sender, THORS_HAMMER, 1, "");
        _mint(msg.sender, SWORD, 10**9, "");
        _mint(msg.sender, SHIELD, 10**8, "");

        // usando batch
        // _mint(msg.sender, [GOLD, SILVER, THORS_HAMMER, SWORD], [1, 1, 1, 1], "");
    }
}