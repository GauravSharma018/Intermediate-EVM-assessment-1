# Intermediate-EVM-assessment-1
This program is a simple contract written in Solidity. This smart contract implements the require(), assert() and revert() statements.

# Description
This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has the following functions :-

(1) Contract successfully uses require() statement. 

(2) Contract successfully uses assert() statement.

(3) Contract successfully uses revert() statement.

# Getting Started
## Functionalities
(1) require(): Used to validate certain conditions before further execution of a function. It takes two parameters as an input.

(2) assert(): The assert function, like require, is a convenience function that checks for conditions. If a condition fails, then the function execution is terminated with an error message.

(3) revert(): Can be used to flag an error and revert the current call. You can also provide a message containing details about the error, and the message will be passed back to the caller. However, the message, like in require(), is an optional parameter. revert() causes the EVM to revert all the changes made to the state, and things return to the initial state or the state before the function call was made.

## Installing
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

## Executing te Program
Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the code from contract.sol file into your file:
```ruby
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
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to latest solidity version (or another compatible version), and then click on the "Compile" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the your contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the  deposit(), withdraw(), triggerAssert() and  triggerRevert() functions.

# Author
Gaurav Sharma

# Licence
This project is licensed under the MIT License - see the LICENSE.md file for details
