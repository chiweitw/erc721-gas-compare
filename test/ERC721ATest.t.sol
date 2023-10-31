// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {ERC721A} from "../src/ERC721A.sol";

contract ERC721ATest is Test {
    ERC721A token;
    address user1;
    address user2;

    function setUp() public {
        token = new ERC721A("Test", "TST");
        user1 = makeAddr("Alice");
        user2 = makeAddr("Bob");
    }

    function testMint() public {
        token.mint(user1, 1);

        assertEq(token.balanceOf(user1), 1);
    }
}