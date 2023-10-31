// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "ERC721A/ERC721A.sol";

contract MyERC721A is ERC721A {
    constructor(string memory name, string memory symbol) ERC721A(name, symbol) {}

    function mint(address to, uint256 quantity) public {
        _safeMint(to, quantity);
    }
}