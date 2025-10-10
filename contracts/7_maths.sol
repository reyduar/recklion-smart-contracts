// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Maths {

    function sum(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    function substract(uint a, uint b) public pure returns (uint) {
        return a - b;
    }

    function multiply(uint a, uint b) public pure returns (uint) {
        return a * b;
    }

    function divide(uint a, uint b) public pure returns (uint) {
        require(b != 0, "Cannot divide by zero");
        return a / b;
    }

    function power(uint base, uint exp) public pure returns (uint) {
        return base**exp;
    }

    function module(uint a, uint b) public pure returns (uint) {
        return a % b;
    }

    // (x+y)%k
    function _modAdd(uint x, uint y, uint k) public pure returns (uint) {
        return addmod(x, y, k)  ;
    }

    // (x*y)%k
    function _mulmod(uint x, uint y, uint k) public pure returns (uint) {
        return mulmod(x, y, k)  ;
    }
}