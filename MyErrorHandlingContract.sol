// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MyErrorHandlingContract {
    address public owner;
    uint256 public value;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function setValue(uint256 _newValue) external onlyOwner {
        // Use require for input validation
        require(_newValue > 0, "Value must be greater than zero");

        // Use assert for internal errors (e.g., overflow)
        uint256 oldValue = value;
        value += _newValue;
        assert(value > oldValue);

        // Simulate a business logic error
        if (_newValue == 111) {
            revert("Oops! The value 111 is not allowed.");
        }
    }
}
