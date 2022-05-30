// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./OpenZeppelin/ERC721/ERC721.sol";
import "./OpenZeppelin/utils/Counters.sol";
import "./OpenZeppelin/access/Ownable.sol";
import "./OpenZeppelin/ERC721/ERC721URIStorage.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("MyNFT", "NFT") {}

    function mintNFT(address recipient, string memory tokenURI)
        public onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}