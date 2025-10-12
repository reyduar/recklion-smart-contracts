// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./111_ERC_20.sol";

contract ImplERC20 is ERC20 {
    constructor() ERC20("Test", "TST") {}

    /* Creacion de nuevos tokens */
    function createTokens() public {
        _mint(msg.sender, 1000);
    }
}