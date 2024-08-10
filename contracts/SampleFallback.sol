// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SampleFallback{
    uint public lastSentValue;
    string public lastFunctionCalled;
    uint public myUInt;

    receive() external payable {
        lastSentValue = msg.value;
        lastFunctionCalled = "received";
     }

     fallback() external payable {
        lastSentValue = msg.value;
        lastFunctionCalled = "fallback";
      }

     // 0xe7b167fc0000000000000000000000000000000000000000000000000000000000000001

      function setMyUInt (uint _myNewUnit) public {
        myUInt = _myNewUnit;
      }
}