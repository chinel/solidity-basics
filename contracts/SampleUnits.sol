// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SampleUnits{
     modifier betweenOneAndTwoEth(){
        require(msg.value >=1 ether && msg.value<=2 ether);
            _;
        
     }
}