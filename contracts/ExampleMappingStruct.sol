// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Wallet{

    struct Transaction{
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numDeposit;
        mapping (uint => Transaction) deposits;
        uint numWithdrawals;
        mapping(uint => Transaction) withdrawals;
    }


    mapping(address => Balance) public balances;

    function depositMoney () public  payable {
        balances[msg.sender].totalBalance  += msg.value;
        Transaction memory deposit = Transaction(msg.value, block.timestamp);

        balances[msg.sender].deposits[balances[msg.sender].numDeposit] = deposit;
        balances[msg.sender].numDeposit++;

    }

    function withdrawMoney (address payable  _to, uint _amount) public{
         balances[msg.sender].numWithdrawals  += 1;
         _to.transfer(_amount);
    }
}