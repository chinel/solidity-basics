// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SmartContract {
       string public myString = "Hello World";

       function updateString (string memory _newString) public payable {
       if(msg.value == 1 ether){
          myString = _newString;
       }else{
         payable (msg.sender).transfer(msg.value);
       }
       
       }

        function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}