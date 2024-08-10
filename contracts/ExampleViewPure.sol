// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleViewPure{
    //this is a public variable with a public getter function called myStorageVariable
    //That is why you see a green button in the transactions section to get the value of the variable
    // it is a reading function
    uint public myStorageVariable;

    //There are 2 types of reading function, the ones that are view functions
    function getMyStorageVariable () public view returns(uint) {
        return myStorageVariable;
    }


    function getAddition (uint a, uint b) public pure returns(uint){
        return a + b;
    }

    function setMyStorageVariable (uint _newVar) public returns(uint){
        myStorageVariable =  _newVar;
        return _newVar;
    }


}