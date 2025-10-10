// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Functions {
    // Pure functions (no need to blockchain access)
    function getName() public pure returns ( string memory ) {
        return "Alice";
    }

    // Views functions ( Can access blockchain data )
    uint256 salaryPerHours = 100;
    function getSalaryPerDay() public view returns ( uint256 ) {
        return salaryPerHours * 8;
    }
}