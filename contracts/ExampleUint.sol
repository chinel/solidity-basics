// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleUint {
    uint public myInt = 8292929;
    uint8 public myInt2 = 250;
    int public myInt3 = -10;
    int public myInt4 = 2**4;
    

    function setMyInt(uint _myInt) public {
        myInt = _myInt;
    }

    function incrementMyInt2 () public {
        myInt2++;
    }

    function incrementMyInt3 () public {
        myInt3++;
    }

    function decrementMyInt3 () public {
        myInt3--;
    }
}