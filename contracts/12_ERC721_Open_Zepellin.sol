// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

// Person 1(Owner): 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// Person 2(Operator): 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2

// Importa de smart contracts de OpenZeppelin
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyERC721OpenZepellin is ERC721 {

    // contadores para los IDs de los NFTs
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // constructor
    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {}
    
    // Envio de NFTs
    function sendNFT(address _account) public {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _safeMint(_account, newItemId);
    }
}
