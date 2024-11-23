// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CoffeToken is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    event coffeePurchased(address indexed receiver, address indexed  buyer);

    constructor() ERC20("CoffeToken", "CFE") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount * 10 ** decimals());
    }

    function buyOneCoffee() public {
      _burn(_msgSender(), 1 * 10 ** decimals()); //this function is inherited from the parent contract, _msgSender() is also the same thing as msg.sender but it is inherited from the parent contract
      emit coffeePurchased(_msgSender(), _msgSender());
    }

    function buyOneCoffeeFrom(address account) public {
        _spendAllowance(account, _msgSender(), 1 * 10 ** decimals());
        _burn(account, 1 * 10 ** decimals());
        emit coffeePurchased(_msgSender(), account);

    }
}