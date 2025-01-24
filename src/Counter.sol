// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Counter {
    uint256 public number;

    event NumberUpdateLog(uint256 numberLog);

    function setNumber(uint256 newNumber) public {
        number = newNumber;
        emit NumberUpdateLog(number);
    }

    function increment() public returns(uint256) {
        number++;
        emit NumberUpdateLog(number);
        return number;
    }

    function decrement() public returns(uint256) {
        require(number > 0, "Counter: underflow detected");
        number--;
        emit NumberUpdateLog(number);
        return number;
    }
}
