// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract MyToken is ERC20, Ownable, Pausable {
    mapping(address => bool) private frozenAccounts;
    mapping(address => bool) private blacklisted;

    event AccountFrozen(address indexed account);
    event AccountUnfrozen(address indexed account);
    event AccountBlacklisted(address indexed account);
    event AccountUnblacklisted(address indexed account);

    constructor() ERC20("MyToken", "MTK") {
        // Mint 1 million tokens to the contract deployer (owner)
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    // Only owner can mint new tokens.
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Any token holder can burn their tokens.
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Owner can freeze an account.
    function freezeAccount(address account) external onlyOwner {
        frozenAccounts[account] = true;
        emit AccountFrozen(account);
    }

    // Owner can unfreeze an account.
    function unfreezeAccount(address account) external onlyOwner {
        frozenAccounts[account] = false;
        emit AccountUnfrozen(account);
    }

    // Owner can blacklist an account.
    function blacklist(address account) external onlyOwner {
        blacklisted[account] = true;
        emit AccountBlacklisted(account);
    }

    // Owner can unblacklist an account.
    function unblacklist(address account) external onlyOwner {
        blacklisted[account] = false;
        emit AccountUnblacklisted(account);
    }

    // Owner can pause all token transfers.
    function pause() external onlyOwner {
        _pause();
    }

    // Owner can unpause token transfers.
    function unpause() external onlyOwner {
        _unpause();
    }

    // Transfer ownership to a new owner.
    function transferOwnership(address newOwner) public override onlyOwner {
        require(newOwner != address(0), "New owner cannot be the zero address");
        _transferOwnership(newOwner);
    }

    // Override _beforeTokenTransfer to implement freeze, blacklist, and pause restrictions.
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal override {
        require(!paused(), "Token transfers are paused");
        require(!blacklisted[from] && !blacklisted[to], "Blacklisted address cannot transfer or receive tokens");
        require(!frozenAccounts[from], "Sender account is frozen");

        super._beforeTokenTransfer(from, to, amount);
    }
}
