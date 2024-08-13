// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleMappingWithdrawals {
    mapping(address => uint) public balanceReceived;

    function sendMoney () public payable  {
        balanceReceived[msg.sender] += msg.value;
    }

   function getBalance () public view returns (uint){
    return address(this).balance;
   }

   function withdrawAllMoney (address payable _to) public {
       _to.transfer(balanceReceived[msg.sender]);
       balanceReceived[msg.sender] = 0;
   }

}