// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PandlesNFT is ERC721, Ownable {
    uint256 public tokenIdCounter;
    mapping(uint256 => NFT) public nfts;

    struct NFT {
        uint256 id;
        string uri;
        uint256 price;
        bool isOnSale;
    }

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {
        tokenIdCounter = 1;
    }

    function createNFT(string memory uri, uint256 price) public onlyOwner {
        uint256 tokenId = tokenIdCounter;
        _safeMint(msg.sender, tokenId);
        nfts[tokenId] = NFT(tokenId, uri, price, false);
        tokenIdCounter++;
    }

    function setTokenURI(uint256 tokenId, string memory uri) public onlyOwner {
        require(_exists(tokenId), "Token ID does not exist");
        nfts[tokenId].uri = uri;
    }

    function setPrice(uint256 tokenId, uint256 price) public onlyOwner {
        require(_exists(tokenId), "Token ID does not exist");
        nfts[tokenId].price = price;
    }

    function putOnSale(uint256 tokenId) public onlyOwner {
        require(_exists(tokenId), "Token ID does not exist");
        nfts[tokenId].isOnSale = true;
    }

    function removeFromSale(uint256 tokenId) public onlyOwner {
        require(_exists(tokenId), "Token ID does not exist");
        nfts[tokenId].isOnSale = false;
    }

    function buyNFT(uint256 tokenId) public payable {
        require(_exists(tokenId), "Token ID does not exist");
        require(nfts[tokenId].isOnSale, "NFT is not on sale");
        require(msg.value >= nfts[tokenId].price, "Insufficient payment");

        address payable seller = payable(ownerOf(tokenId));
        address buyer = msg.sender;
        uint256 price = nfts[tokenId].price;

        _transfer(seller, buyer, tokenId);
        nfts[tokenId].isOnSale = false;

        seller.transfer(price);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "Token ID does not exist");
        return nfts[tokenId].uri;
    }
}
