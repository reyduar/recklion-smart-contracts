// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract ETHSend {
    constructor() payable  {}

    receive() external payable {}

    // Event 
    event sendStatus(bool);
    event callStatus(bool, bytes);

    // Transfer(recomendado por seguridad)
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(1 ether);
    }

    // Send(no es comun usarlo)
    function sendViaSend(address payable _to) public payable {
        bool success = _to.send(1 ether);
        emit sendStatus(success);
        require(success, "Failed to send ether");
    }

    // Call(Ocupa menos gas)
    function sendViaCall(address payable _to) public payable {
        (bool success, bytes memory data) = _to.call{value: 1 ether}("");
        emit callStatus(success, data);
        require(success, "Failed to call receive Ether");
    }

}

contract ETHReceiver {
    event log(uint amount, uint gas);

    receive() external payable {
        emit log(address(this).balance, gasleft());
     }
}