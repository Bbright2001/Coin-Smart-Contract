// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Coin{
    //state
    address public minter;

    mapping(address => uint) public walletBalance;

    //error
    error insufficientFunds(uint availableBalance, uint requestdAmount);
    error onlyOwner();

    //events
    event sent(address to, uint amountSent);

    //constructor
    constructor(){
        minter = msg.sender;
    }


 function mintCoin(uint amount) external{
        if( !(minter == msg.sender) ) revert onlyOwner();

    walletBalance[msg.sender] += amount;
 }

 function send(address to, uint amount) external{
    if (amount > walletBalance[msg.sender] ) {

        revert insufficientFunds ( walletBalance[msg.sender], amount );
    }

    walletBalance[msg.sender] -= amount;
    walletBalance[to] += amount;
    emit sent (to, amount);
 }

 function getUserBalance(address to) public view returns (uint256) {
    return walletBalance[to];
 }
}
