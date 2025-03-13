
## Overview
MyToken (MTK) is an ERC-20 token built on the Ethereum blockchain with additional security and management features.  
This token includes standard ERC-20 functionalities along with features like minting, burning, freezing accounts, blacklisting, and pausing transactions.

## Features
- ✅ **Minting & Burning**: The owner can mint new tokens, and users can burn their own tokens.
- ✅ **Freezing Accounts**: The owner can freeze and unfreeze specific accounts.
- ✅ **Blacklisting**: The owner can blacklist or unblacklist addresses, preventing them from transactions.
- ✅ **Pausing Transactions**: The owner can pause or resume all token transfers.
- ✅ **Ownership Transfer**: The owner can transfer contract ownership to another address.

## Token Details
| Property      | Value                  |
|--------------|------------------------|
| **Name**     | MyToken                |
| **Symbol**   | MTK                    |
| **Decimals** | 18                      |
| **Total Supply** | 1,000,000 MTK |

## Functions
### **Standard ERC-20 Functions**
- `totalSupply()`: Returns the total token supply.
- `balanceOf(address account)`: Returns the token balance of a specific account.
- `transfer(address recipient, uint256 amount)`: Transfers tokens to another account.
- `approve(address spender, uint256 amount)`: Allows another account to spend tokens on behalf of the owner.
- `allowance(address owner, address spender)`: Returns the remaining tokens an account is allowed to spend.
- `transferFrom(address sender, address recipient, uint256 amount)`: Transfers tokens from one account to another.

### **Additional Features**
- `mint(address to, uint256 amount)`: Owner can mint new tokens.
- `burn(uint256 amount)`: Token holders can burn tokens from their balance.
- `freezeAccount(address account)`: Owner can freeze an account.
- `unfreezeAccount(address account)`: Owner can unfreeze an account.
- `blacklist(address account)`: Owner can blacklist an account.
- `unblacklist(address account)`: Owner can remove an account from the blacklist.
- `pause()`: Owner can pause all token transfers.
- `unpause()`: Owner can resume token transfers.
- `transferOwnership(address newOwner)`: Owner can transfer contract ownership.

## Installation & Deployment
### Prerequisites
- Node.js installed
- Hardhat framework

