// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Coin{
    //state
    address public minter;

    mapping(address => uint) public walletbalance;

    //error
    error insufficientFunds(uint availableBalance, uint requestdAmount);

    //events
    event sent(address to, uint amountSent);

    //constructor
    constructor(){
        minter = msg.sender;
    }


 function mintCoin(address to, uint amount) external{
    require(minter == msg.sender, "Not Owner");

    walletbalance[msg.sender] += amount;
 }

 function send (address to, uint amount) external{
    if (amount > walletbalance[msg.sender] ) {

        revert insufficientFunds ( walletbalance[msg.sender], amount );
    }

    walletbalance[msg.sender] -= amount;
    walletbalance[to] += amount;
    emit sent ( to, amount );
 }
}