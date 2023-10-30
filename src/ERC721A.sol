// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "ERC721A/ERC721A.sol";

contract ERC721A is ERC721A {
    function mint(address to, uint256 amount) public {
        _safeMint(to, amount);
    }
}