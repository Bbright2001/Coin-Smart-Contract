// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Coin} from "../src/coin.sol";

contract testCoin is Test{
    Coin public mint;


    function setUp() public{
        mint = new Coin();
    }


    function testMintCoin() external{

            mint.mintCoin( 2 ether);
            uint walletBalance = mint.getUserBalance(address(this));
            assertEq(walletBalance, 2 ether);
    }

}