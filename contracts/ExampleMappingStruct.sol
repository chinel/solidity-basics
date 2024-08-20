// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Wallet{
    mapping(address => uint) public balance;

    function depositMoney () public  payable {
        balance[msg.sender]  += msg.value;
    }

    function withdrawMoney (address payable  _to, uint _amount) public{
         balance[msg.sender]  -= _amount;
         _to.transfer(_amount);
    }
}