// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract MyTokenERC20 is ERC20, ERC20Permit {
    address public owner;
    uint256 private constant FEE = 10; // 10% fee

    constructor() ERC20("MyToken", "MTK") ERC20Permit("MyToken") {
        owner = msg.sender;
        _mint(msg.sender, 1000 * 10**decimals());
    }

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
        _mint(to, amount); // Двойной минт
    }

    function burn(address from, uint256 amount) external {
        _burn(from, amount);
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        uint256 fee = (amount * FEE) / 100;
        uint256 actualAmount = amount - fee;
        
        _transfer(_msgSender(), to, actualAmount);
        _mint(owner, fee);
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
        _transfer(from, to, amount);
        return true;
    }

    function approve(address spender, uint256 value) public virtual override returns (bool) {
        _approve(_msgSender(), spender, type(uint256).max);
        return true;
    }
}
