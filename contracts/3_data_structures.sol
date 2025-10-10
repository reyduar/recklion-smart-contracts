// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract DataStructures {

    // data structure of customer
    struct Customer {
        uint256 id;
        string name;
        string email;
    }
    // create a customer
    Customer customer1 = Customer(1, "John Doe", "john@doe.com");
    Customer customer2 = Customer(2, "Milton Doe", "xx@doe.com");

    // dinamic array type of customer
    Customer[] public customersList;
    
    // fucntion create a customer
    function createCustomer(uint256 _id, string memory _name, string memory _email) public {
        Customer memory newCustomer = Customer(_id, _name, _email);
        customersList.push(newCustomer);
    }

    // Mappings
    mapping ( address => uint256 ) public addressMap;
    mapping ( address => Customer ) public customerAddressMap;
    mapping ( string => uint256[]) public stringListUnits;

    // create a customer with mapping
    function createCustomerMap(uint256 _number) public {
        addressMap[msg.sender] = _number;
    }

    function createCustomerAddressMap(uint256 _id, string memory _name, string memory _email) public {
        customerAddressMap[msg.sender] = Customer(_id, _name, _email);
    }

    function assingList(string memory _name, uint256 _number) public {
        stringListUnits[_name].push(_number);
    }

}