// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MyErrorHandlingContract {
    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
        balance = 0;
    }

    function deposit(uint amount) public {
        require(msg.sender == owner, "Only the owner can deposit funds");
        require(amount > 0, "Invalid amount");
        balance += amount;
    }

    function withdraw(uint amount) public {
        require(msg.sender == owner, "Only the owner can withdraw funds");
        require(amount > 0, "Invalid amount");
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
    }

     // Function to trigger an assert statement (used for internal errors)
    function triggerAssert() external view {
        assert(balance > 100);
    }

    // Function to trigger a revert statement (used for complex conditions)
    function triggerRevert(uint256 amount) external pure {
        if (amount > 100) {
            revert("Amount exceeds the limit of 100");
        }
    }
}