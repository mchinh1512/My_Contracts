// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./OpenZeppelin/ERC20/ERC20.sol";

contract CPToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("Chinh Pham Token", "CPT") {
        _mint(msg.sender, initialSupply);
    }
}