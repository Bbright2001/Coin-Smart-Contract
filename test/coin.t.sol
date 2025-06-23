// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Coin} from "../src/coin.sol";

contract testCoin is Test{
          Coin public mint;
           address public user;

    function setUp() public{
           mint = new Coin();
           user = address(0x1);
    }


    function testMintCoin() external{

            mint.mintCoin( 2 ether);
            uint walletBalance = mint.getUserBalance(address(this));
            assertEq(walletBalance, 2 ether);
    }

    function testSend()external{
            mint.mintCoin(5 ether);
            mint.send(user, 3 ether);
            uint walletBalance = mint.getUserBalance(user);
            assertEq(walletBalance, 3 ether);
    }

    function testNotOwner() external{
            vm.prank(user);
            vm.expectRevert("Not Owner");
            mint.mintCoin(4 ether);
    }

    function testInsufficientBalance() external{
            mint.mintCoin(10 ether);

            vm.expectRevert(
                abi.encodeWithSelector(
                    Coin.insufficientFunds.selector,
                    10 ether,
                    12 ether 
                )
            );
            mint.send(user, 12 ether);

            uint walletBalance = mint.getUserBalance(user);
            assertEq(walletBalance, 0 ether);
    }
   

}