// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract IteratorsConditionals {
    /* Suma de los 10 primero numeros a partir del un numero introducido */
    function sum10(uint _num) public pure returns (uint) {
        uint sum = 0;
        for (uint i = _num; i < (_num + 10); i++) {
            sum += i;
        }
        return sum;
    }

    /* Suma de los 10 primeros numeros a partir impares */
    function sum10Impares() public pure returns (uint) {
        uint sum = 0;
        uint _num = 0;
        uint _counter = 0;
        while (_counter < 10) {
            if (_num % 2 != 0) {
                sum += _num;
                _counter++;
            }
            _num++;
        }
        return sum;
    }

    function mathOperations(string memory operation, uint a, uint b) public pure returns (uint) {
        bytes32 operationHash = keccak256(abi.encodePacked(operation));
        if (operationHash == keccak256(abi.encodePacked("sum"))) {
            return a + b;
        } else if (operationHash == keccak256(abi.encodePacked("sub"))) {
            return a - b;
        } else if (operationHash == keccak256(abi.encodePacked("mul"))) {
            return a * b;
        } else if (operationHash == keccak256(abi.encodePacked("div"))) {
            return a / b;
        } else {
            return 0;
        }
    }        

}