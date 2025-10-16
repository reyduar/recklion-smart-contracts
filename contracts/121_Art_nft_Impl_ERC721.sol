// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.4.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.4.2/access/Ownable.sol";

contract ArtToken is ERC721, Ownable {

    /* Initial Statements */

    // Smart contract constructor
    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {}

    // NFT token counter
    uint256 COUNTER;

    // Pricing of NFT tokens (price of the artwork)
    uint256 public fee = 5 ether;

    // Data structure with the properties of the artwork
    struct Artwork {
        uint256 id;
        string name;
        uint256 dna;
        uint256 level;
        uint8 rarity;
    }

    // Storage structure for keeping artworks
    Artwork [] public artWorksStore;

    // Event declaration
    event NewArtwork(address indexed owner, uint256 id, uint256 dna);

    /* Help functions */

    // Random number creation (required for NFT token properties)
    function _createRandomNumber(uint256 _mod) internal view returns (uint256) {
        bytes32 hasRandomNum = keccak256(abi.encodePacked(block.timestamp, msg.sender));
        uint256 randomNum = uint256(hasRandomNum);
        return randomNum % _mod;
    }

    // NFT Token Creation (Artwork)
    function _createArtwork(string memory _name) internal {
        uint8 ranRarity = uint8(_createRandomNumber(1000));
        uint256 ranDna = _createRandomNumber(10**16);
        Artwork memory newArtwork = Artwork(COUNTER, _name, ranDna, 1, ranRarity);
        artWorksStore.push(newArtwork);
        _safeMint(msg.sender, COUNTER);
        emit NewArtwork(msg.sender, COUNTER, ranDna);
        COUNTER++;
    }

    // NTF Token Price Update
    function updatePrice(uint256 _newPrice) external onlyOwner {
        fee = _newPrice;
    }

    // Visualize the balance of Smart Contract (ethers)
    function infoSmartContract() public view onlyOwner returns (address, uint256) {
        address scAddress = address(this);
        // convert wei to ether totalwei / 10ˆ18
        uint scMoney = address(this).balance / 10**18;
        return (scAddress, scMoney);
    }

    // Obtainig all created NFT tokens (get all of artworks)
    function getAllArtworks(address _owner) public view returns (Artwork[] memory) {
        Artwork[] memory results = new Artwork[](balanceOf(_owner));
        uint256 counterOwner = 0;
        for (uint256 i = 0; i < COUNTER; i++) {
            if (ownerOf(i) == _owner) {
                results[counterOwner] = artWorksStore[i];
                counterOwner++;
            }
        }
        return artWorksStore;
    }

    /* NFT Token Development */

    // NFT Token Payment
    function createRandomArtwork(string memory _name) public payable {
        require(msg.value == fee, "You need to pay the fee");
        _createArtwork(_name);
    }

    // Extraction of ethers from the Smart Contract to the Owner
    function withdraw() external payable onlyOwner {
        address payable _owner = payable(owner());
        _owner.transfer(address(this).balance);
    }

    // Level up NFT Token
    function levelUp(uint256 _id) public {
        // require(msg.value == fee, "You need to pay the fee"); /* Needs to set function as a payable */
        require(ownerOf(_id) == msg.sender, "You are not the owner of this artwork");
        Artwork storage artwork = artWorksStore[_id];
        artwork.level++;
    }


}
