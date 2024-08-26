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

    function getDepositNum (address _from, uint _numDeposits) public view returns(Transaction memory){
     return  balances[_from].deposits[_numDeposits];
    }

    function depositMoney () public  payable {
        balances[msg.sender].totalBalance  += msg.value;
        Transaction memory deposit = Transaction(msg.value, block.timestamp);

        balances[msg.sender].deposits[balances[msg.sender].numDeposit] = deposit;
        balances[msg.sender].numDeposit++;

    }

    function withdrawMoney (address payable  _to, uint _amount) public{
         balances[msg.sender].totalBalance -= _amount;

         Transaction memory withdrawal = Transaction(_amount, block.timestamp);

         balances[msg.sender].withdrawals[balances[msg.sender].numWithdrawals] = withdrawal;

         balances[msg.sender].numWithdrawals++;

         _to.transfer(_amount);
    }
}