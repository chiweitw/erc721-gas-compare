// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {MyERC721Enumerable} from "../src/MyERC721Enumerable.sol";

contract MyERC721EnumerableTest is Test {
    MyERC721Enumerable token;
    address user1;
    address user2;

    function setUp() public {
        token = new MyERC721Enumerable("Test", "TST");
        user1 = makeAddr("Alice");
        user2 = makeAddr("Bob");
    }

    function testMint() public {
        token.mint(user1, 1);

        assertEq(token.balanceOf(user1), 1);
    }
}