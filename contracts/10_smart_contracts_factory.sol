// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Parent {
    // Almacenamiento de la informarcion del factory
    mapping (address => address) personalContract;

    // Emision de los nuevo contratos
    function factory() public {
        address addrPersonalContract = address(new Child(msg.sender, address(this)));
        personalContract[msg.sender] = addrPersonalContract;
    }

}

contract Child {
    // Estructura de datos del propietario
    Owner public propietario;
    struct Owner {
        address _owner;
        address _smartContractParent;
    }

    // Datos recibido al nuevo smart contract
    constructor(address _account, address _accountSC) {
       propietario._owner = _account;
       propietario._smartContractParent = _accountSC;
    }
}

