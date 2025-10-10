// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

/* fallback() y receive() ? */

/* msg.data -> el calldata completo, que es un area no modificable y no
persistente en la que se almacenan los argumentos de la funcion y que se
comporta principalmente como la memoria 
        Ether envia al Smart Contract
                    |
                    |
                msg.data vacio?
                    |
                    |
                SI -> receive() exite ? -> receive() 
                NO -> fallback()
*/

contract FallbackReceiveEther {
    event log(string _name, address _sender, uint _amount, bytes _data);

    fallback() external payable { 
        emit log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable { 
        emit log("receive", msg.sender, msg.value, "");
    }
}