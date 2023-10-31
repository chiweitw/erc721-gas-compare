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

    function testMint10() public {
        for(uint256 i=0; i<10; i++) {
            token.mint(user1, i);
        }
        assertEq(token.balanceOf(user1), 10);
    }


    function testTransferFrom() public {
        vm.startPrank(user1);
        token.mint(user1, 0);
        token.safeTransferFrom(user1, user2, 0);
        vm.stopPrank();

        assertEq(token.balanceOf(user2), 1);
    }

    function testTransferFrom10() public {
        vm.startPrank(user1);
        for(uint256 i=0; i<10; i++) {
            token.mint(user1, i);
        }
        for(uint256 i=0; i<10; i++) {
            token.safeTransferFrom(user1, user2, i);
        }
        vm.stopPrank();

        assertEq(token.balanceOf(user2), 10);
    }

    function testApprove() public {
        vm.startPrank(user1);
        token.mint(user1, 1);
        token.approve(user2, 1);
        vm.stopPrank();

        vm.startPrank(user2);
        token.safeTransferFrom(user1, user2, 1);
        vm.stopPrank();

        assertEq(token.balanceOf(user2), 1);
    }
}