// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleMappings{
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping; // you can also use this example for white listing
    mapping(uint => mapping(uint => bool)) public uintUintBoolMapping; // this can be used for balances and token contracts or allowances, votings for governance contract

    function setValue (uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }

    function setUintUintBoolMapping(uint _key1, uint _key2, bool _value) public {
        uintUintBoolMapping[_key1][_key2] = _value;
    }
}