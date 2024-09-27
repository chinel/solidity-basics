// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SmartContracWallet{
 address payable owner;
 mapping(address => uint) public allowance;
 mapping (address => bool) public isAllowedToSend;

 constructor() {
    owner = payable(msg.sender);
 }

 function setAllowance(address _for, uint _amount) public{
  require(msg.sender == owner, "You are not the owner, aborting");
  allowance[msg.sender] = _amount;

  if(_amount > 0){
   isAllowedToSend[_for] = true;
  }else{
   isAllowedToSend[_for] = false;
  }


 }

function transfer(address payable _to, uint _amount, bytes memory _payload) public returns(bytes memory){
    require(msg.sender == owner, "You are not the owner, aborting!!");
    if(msg.sender != owner){
     require(allowance[msg.sender] >= _amount,"You are trying to send more than you are allowed to, aborting!!");
     require(isAllowedToSend[msg.sender], "You are not allowed to send anything from this smart contract, aborting!!");

     allowance[msg.sender] -= _amount;
    }

   (bool success, bytes memory returnData) =  _to.call{value: _amount}(_payload);
   require(success,"Aborting, call was not successful");
   return  returnData;
} 

receive() external payable { }
}