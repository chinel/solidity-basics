// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Wallet{

    struct PaymentReceivedStruct{
        address from;
        uint amount;
    }

    PaymentReceivedStruct public payment;

    function payContract () public payable {
       //payment = PaymentReceivedStruct(msg.sender, msg.value); One way to call the struct
       payment.from = msg.sender;
       payment.amount = msg.value;
    }
}