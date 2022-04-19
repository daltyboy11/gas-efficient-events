//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract Wallet2 {

    mapping(address => uint256) private balances;

    function withdraw(uint256 amount) external {
        require(amount <= balances[msg.sender], "insufficient balance");

        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);

        // emit event
        uint256 remaining = balances[msg.sender];
        assembly {
            // Store the identifier 0x2 immediately to the left
            // of the 20 bytes used for the address
            mstore(0, xor(shl(160, 0x2), caller())) 
            // next 32 bytes stores the amount withdrawan
            mstore(32, amount) 
            // next 32 bytes stores the remaining balance
            mstore(64, remaining) 
            log0(0, 96) // log all 128 bytes of data
        }
    }

    function deposit() external payable {
        require(msg.value > 0, "0 deposit");
        balances[msg.sender] += msg.value;

        // emit event
        uint256 _balance = balances[msg.sender];
        assembly {
            // Store the identifier 0x1 immediately to the left
            // of the 20 bytes used for address
            mstore(0, xor(shl(160, 0x1), caller())) 
            // In the next 32 bytes store the amount deposited
            mstore(32, callvalue()) 
            // In the next 32 bytes store the balance after deposit
            mstore(64, _balance) 
            log0(0, 96) // log all 128 bytes of data
        }
    }

    function getBalance(address _address)
        public
        view
        returns (uint256)
    {
        return balances[_address];
    }
}
