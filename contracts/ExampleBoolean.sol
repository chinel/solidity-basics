// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleBoolean{
    bool public myBoolean;

    function setMyBoolean(bool _mybool) public {
        myBoolean = _mybool;
    }
}