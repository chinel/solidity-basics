// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract WillThrow{
      error NotAllowedError(string);
      function aFunction () public pure {
        //require(false, "Error Message");
       // assert(false);
       revert NotAllowedError("You are not allowed");
      }
}

contract ErrorHandling{
    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLogBytes(bytes lowLevelCode);

    function catchTheError() public {
        WillThrow willThrow = new WillThrow();

        try willThrow.aFunction(){
           //add code here if it works
        } catch Error(string memory reason){
            //for require excpetions
          emit ErrorLogging(reason);
        } catch Panic (uint errorCode){
             // for assert exceptions
        emit  ErrorLogCode(errorCode);
        }
        catch (bytes memory lowLevelData){
            //for other types of exceptions
          emit ErrorLogBytes(lowLevelData);
        }
    }
}