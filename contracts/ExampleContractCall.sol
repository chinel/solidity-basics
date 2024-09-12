// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


contract ContractOne{
   mapping(address => uint)  public addressBalances;

   function deposit() public payable {
    addressBalances[msg.sender] += msg.value;
   }

  // this is necessary to receive funds. From contract four's example approach
   receive() external payable {
    deposit();
    }

}


//If you know the smart contract you can use this approach
contract ContactTwo{

   receive() external payable { }

   function depositContractOne (address payable  _contractOne) public {
     ContractOne one = ContractOne(_contractOne);
     one.deposit{value:10, gas:100000}();
   }
}

//If you do not know the smart contract or if it is a smart contract, you can use low level calls,
contract ContractThree {
 receive() external payable { }

   function depositContractOne (address _contractOne) public {
    bytes memory payload = abi.encodeWithSignature("deposit()");
    (bool success, ) = _contractOne.call{value:10, gas:100000}(payload);
    require(success);
   }
}

//If you do not know the smart contract or any of its functions at all, you can use this approach
//Be careful as this has a potential for reentrancy issue, so you have to use the check, effects, interactions pattern here
contract ContractFour{
    receive() external payable { }

    function depositContractOne(address _contractOne) public {
        (bool success, ) = _contractOne.call{value: 10, gas:100000}("");
        require(success);
    }
}