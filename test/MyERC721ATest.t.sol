// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {MyERC721A} from "../src/MyERC721A.sol";

contract MyERC721ATest is Test {
    MyERC721A token;
    address user1;
    address user2;

    function setUp() public {
        token = new MyERC721A("Test", "TST");
        user1 = makeAddr("Alice");
        user2 = makeAddr("Bob");
    }

    function testMint() public {
        token.mint(user1, 1);

        assertEq(token.balanceOf(user1), 1);
    }

    function testTransfrom() public {
        vm.startPrank(user1);
        token.mint(user1, 1);
        token.safeTransferFrom(user1, user2, 0);
        vm.stopPrank();

        assertEq(token.balanceOf(user2), 1);
    }

    function testApprove() public {
        vm.startPrank(user1);
        token.mint(user1, 1);
        token.approve(user2, 0);
        vm.stopPrank();

        vm.startPrank(user2);
        token.safeTransferFrom(user1, user2, 0);
        vm.stopPrank();

        assertEq(token.balanceOf(user2), 1);
    }
}