// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleMsgSender {
    
    address public myAddress;

    function updateSomeAddress() public {
      myAddress = msg.sender;
    }
}