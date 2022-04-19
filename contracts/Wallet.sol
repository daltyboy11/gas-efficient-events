//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Wallet {

    /// @notice Emitted upon successful withdrawal
    /// @param _address withdrawer address
    /// @param withdrawan amount sent to withdrawer
    /// @param remaining leftover balance
    event Withdrawal(address indexed _address, uint256 withdrawan, uint256 remaining);

    /// @notice emitted upon successful deposit
    /// @param _address depositor address
    /// @param deposited amount deposited
    /// @param available balance after deposit
    event Deposit(address indexed _address, uint256 deposited, uint256 available);

    mapping(address => uint256) private balances;

    function withdraw(uint256 amount) external {
        require(amount <= balances[msg.sender], "insufficient balance");

        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);

        emit Withdrawal(msg.sender, amount, balances[msg.sender]);
    }

    function deposit() external payable {
        require(msg.value > 0, "0 deposit");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value, balances[msg.sender]);
    }

    function getBalance(address _address)
        public
        view
        returns (uint256)
    {
        return balances[_address];
    }
}
