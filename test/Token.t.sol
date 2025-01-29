// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Token} from "../src/Token.sol";

contract TokenTest is Test {
    address alice = address(0xaaa);
    address bob = address(0xbbb);
    Token token;

    function setUp() public {
        vm.label(alice, "Alice");
        vm.label(bob, "bob");

        vm.prank(alice);
        token = new Token(1000000);
    }

    function test_initialize() public view {
        assertEq(token.totalSupply(), 1000000);
        assertLe(token.totalSupply(), 1000000);
        assertGt(token.totalSupply(), 0);
        assertNotEq(token.totalSupply(), 0);
    }

    function test_initial_alice_balance() public view {
        assertEq(token.balanceOf(alice), 1000000);
    }

    function test_transfer() public {
        vm.prank(alice);
        token.transfer(bob, 100);
        assertEq(token.balanceOf(bob), 100);
        assertEq(token.balanceOf(alice), 999900);
    }

    function test_fail() public {
        vm.prank(alice);
        vm.expectRevert();
        token.transfer(bob, 2000000 *1e18);
    }

    function test_my_name() public view {
        assertEq(token.name(), "My token");
    }

    function test_symbol() public view {
        assertEq(token.symbol(), "TOKEN");
    }

  
}
