// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Coin{
    //state
    address public minter;

    mapping(address => uint) public Walletbalance;

    //error
    error insufficientFunds(uint availableBalance, uint requestdAmount);

    //events
    event sent(address to, uint amountSent);

    //constructor
    constructor(){
        minter = msg.sender;
    }

}