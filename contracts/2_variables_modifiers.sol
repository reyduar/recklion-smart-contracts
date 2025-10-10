// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract VariablesModifiers {
    // Values integer without signs (unit)
    uint256 a;
    uint8 public b = 3;

    // Values integer with sign (int)
    int256 c = -5;
    int8 public d = -10;
    int e = 10;

    // Strings variables
    string f = "I am not visible guy";
    string public g = "I am a public";
    string private h = "I am a private";

    // Boolean variables
    bool public is_active = true;
    bool private is_visible = false;

    // Bytes variables
    bytes32 my_bytes = "I am a bytes32";
    bytes4 public my_bytes_public;
    bytes1 byte_1;

    // Hash algorithms
    bytes32 public hashKeccak = keccak256(abi.encodePacked("I am a hash", uint(10), msg.sender));
    bytes32 public hashSha256 = sha256(abi.encodePacked("I am a hash"));
    bytes20 public hashRipem160 = ripemd160(abi.encodePacked("I am a hash"));

    // Address variables
    address public my_address = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    address public owner = msg.sender;

    // Enums variables
    enum Status {Pending, Shipped, Accepted, Rejected, Canceled}
    Status constant defaultStatus = Status.Pending;
    Status public status = Status.Canceled;

    function setAccept() public {
        status = Status.Accepted;
    }

    function setReject() public {
        status = Status.Rejected;
    }

    function display() public view returns (Status) {
        return status;
    }
}