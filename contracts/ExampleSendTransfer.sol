// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Sender{
    receive() external payable { }

    function withdrawTransfer(address payable  _to) public{
     _to.transfer(10);
    }

    function withdrawSend(address payable _to) public {
     bool isSent = _to.send(10);
     require(isSent, "Sending the funds was unsuccessful");
    }
}

//This particular contract does not do anything, just receives the funds
contract ReceiverNoAction{

    function balance ()public view returns (uint){
      return address(this).balance;
    }

    receive() external payable { }
}

//This contract receives the funds and writes to a storage variable.
//Writing to a storage variable cost gas, writing to the variable the first time especially costs a lot of gas.
contract RecieverAction{
    uint public balanceRecieved;

    receive() external payable {
        balanceRecieved +=  msg.value;
     }

  function balance ()public view returns (uint){
      return address(this).balance;
    }
}