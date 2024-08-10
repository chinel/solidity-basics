// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleConstructor{
    address public myAddress;

    constructor(address _anotherAddress){
        myAddress = _anotherAddress;
    }

    function setAddress (address _someAddress) public {
        myAddress = _someAddress;
    }

    function updateAddress () public{
      myAddress = msg.sender;
    }
    
    }