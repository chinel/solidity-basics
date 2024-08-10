// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleAddress {
    address public  myAddress;

    function setAddress (address _myaddress) public{
        myAddress = _myaddress;
    }

    function getAddressBalance() public view returns(uint){
        return myAddress.balance;
    }
}