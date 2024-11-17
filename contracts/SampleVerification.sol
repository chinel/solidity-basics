// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyContract{
    mapping (address => uint) public balance;

    constructor() {
        balance[msg.sender] = 100;
    }

    function transfer (address to, uint amount) public {
        balance[msg.sender] -= amount;
        balance[to] += amount;
    }

    function exampleFunction (address _adr) public view returns(uint){
      return  balance [_adr];
    }

}