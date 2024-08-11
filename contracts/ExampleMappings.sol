// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleMappings{
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping; // you can also use this example for white listing

    function setValue (uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }
}