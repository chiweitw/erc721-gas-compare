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

    function testMint5() public {
        for(uint256 i=0; i<5; i++) {
            token.mint(user1, i);
        }
        assertEq(token.balanceOf(user1), 5);
    }


    function testMint1TransferFrom1() public {
        vm.startPrank(user1);
        token.mint(user1, 0);
        token.safeTransferFrom(user1, user2, 0);
        vm.stopPrank();

        assertEq(token.ownerOf(0), user2);
    }

    function testMint5TransferFrom1() public {
        vm.startPrank(user1);
        for(uint256 i=0; i<5; i++) {
            token.mint(user1, i);
        }
        token.safeTransferFrom(user1, user2, 0);
        vm.stopPrank();

        assertEq(token.ownerOf(0), user2);
    }

    function testMint5TransferFrom3() public {
        vm.startPrank(user1);
        for(uint256 i=0; i<5; i++) {
            token.mint(user1, i);
        }
        token.safeTransferFrom(user1, user2, 2);
        vm.stopPrank();

        assertEq(token.ownerOf(2), user2);
    }

    function testMint5TransferFrom5() public {
        vm.startPrank(user1);
        for(uint256 i=0; i<5; i++) {
            token.mint(user1, i);
        }
        token.safeTransferFrom(user1, user2, 4);
        vm.stopPrank();

        assertEq(token.ownerOf(4), user2);
    }

    function testMint1Approve1() public {
        vm.startPrank(user1);
        token.mint(user1, 0);
        token.approve(user2, 0);
        vm.stopPrank();

        assertEq(token.getApproved(0), user2);
    }

    function testMint5Approve1() public {
        vm.startPrank(user1);
        for(uint256 i=0; i<5; i++) {
            token.mint(user1, i);
        }
        token.approve(user2, 0);
        vm.stopPrank();

        assertEq(token.getApproved(0), user2);
    }

    function testMint5Approve3() public {
        vm.startPrank(user1);
        for(uint256 i=0; i<5; i++) {
            token.mint(user1, i);
        }
        token.approve(user2, 2);
        vm.stopPrank();

        assertEq(token.getApproved(2), user2);
    }

    function testMint5Approve5() public {
        vm.startPrank(user1);
        for(uint256 i=0; i<5; i++) {
            token.mint(user1, i);
        }
        token.approve(user2, 4);
        vm.stopPrank();

        assertEq(token.getApproved(4), user2);
    }
}