// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Food {
    // Estructura de datos
    struct MenuItem {
        string name;
        string ingredients;
    }

    // Menu del dia
    MenuItem[] public menu;

    // Crear nuevo menu
    function createMenuItem(string memory _name, string memory _ingredients) public {
        MenuItem memory newItem = MenuItem(_name, _ingredients);
        menu.push(newItem);
    }
}

contract Hamburguer is Food {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // cocinar una hamburguesa desde el smart contract principal
    function cookHamburguer(string memory _ingredients, uint _units) external {
        require(_units <= 5, "Hamburguer limit is 5");
        createMenuItem("Hamburguer", _ingredients);
    }

    // Modifier: permitir el acceso unicamente al owner y solo al owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    // Implemetamos el modifier onlyOwner
    function hasPrivateNumber(uint _number) public view onlyOwner returns (bytes32) {
        return keccak256(abi.encodePacked(_number));
    }
}