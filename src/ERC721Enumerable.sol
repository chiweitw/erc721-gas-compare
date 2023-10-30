// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "openzeppelin-contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract ERC721Enumerable is ERC721, ERC721Enumerable {
    function mint(address to, uint256 tokenId) public {
        _safeMint(to, tokenId);
    }
}