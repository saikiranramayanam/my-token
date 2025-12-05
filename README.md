#MyToken (MTK)


## Overview
MyToken is a simple ERC-20 compatible token created and deployed on the Ethereum blockchain using Remix IDE. This project is developed for learning and demonstrating basic token functionalities such as transfers, approvals, and balance tracking.

## Token Details

Name: MyToken

Symbol: MTK

Decimals: 18

Total Supply: 100 MTK 

## Features

✔️ Standard ERC-20 style implementation

✔️ Ability to transfer tokens between accounts

✔️ approve and transferFrom functions to allow delegated transfers

✔️ Event logging for Transfer and Approval for transparency

✔️ Balance tracking through balanceOf

## How to Deploy

- Open Remix IDE in your browser

- Create a new file named MyToken.sol

- Paste the full Solidity contract code

- Select Solidity Compiler 0.8.x and click Compile

- Open Deploy & Run Transactions

- Enter a total supply value

- Click Deploy to publish the token contract

## How to Use
### Check Balance

- balanceOf(address user) → returns uint256

This function returns the token balance of any address.


-  Transfer Tokens
transfer(address to, uint256 amount) → returns bool

Used to send tokens from your address to another.


-  Approve Spending
approve(address spender, uint256 amount) → returns bool

Allows another address to spend tokens on your behalf.


-  Transfer on Behalf
transferFrom(address from, address to, uint256 amount) → returns bool

Used by the approved spender to perform delegated transfers.