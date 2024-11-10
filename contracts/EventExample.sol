// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract EventExample{
    mapping(address => uint) public tokenBalance;

    event TokensSent(address _from, address _to, uint _amount);//this is how to create an event

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

 function sendToken(address _to, uint _amount) public returns(bool){
   require(tokenBalance[msg.sender] >= _amount, "Not enough Tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
        emit TokensSent(msg.sender, _to, _amount); // if the require statement was successful we are sending a custom event.
        return true;
 }   

}