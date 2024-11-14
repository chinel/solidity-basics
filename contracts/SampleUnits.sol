// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SampleUnits{
     modifier betweenOneAndTwoEth(){
        require(msg.value >=1 ether && msg.value<=2 ether);
            _;
        
     }
}

contract sampleTime{
     uint runUntilTimestamp;
     uint startTimestamp;

     constructor(uint startDays) {
          startTimestamp = block.timestamp + (startDays) * 24 * 60 * 60;  //startTimestamp = block.timestamp + (startDays) 1 days; 
          runUntilTimestamp = startTimestamp + (7 * 24 * 60 * 60 ); // runUntilTimestamp = startTimestamp + 7 days;
     }
} 