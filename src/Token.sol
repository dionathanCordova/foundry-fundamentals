// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {ERC20} from "lib/solady/src/tokens/ERC20.sol";

contract Token is ERC20 {

    constructor(uint256 _amount) {
        _mint(msg.sender, _amount);
    }

    function name() public pure override returns(string memory) {
        return "My token";
    }

    function symbol() public pure override returns (string memory){
        return "TOKEN";
    }
}