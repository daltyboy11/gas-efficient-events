const { expect } = require("chai");
const { BigNumber } = require("ethers");
const { ethers } = require("hardhat");

const getWalletEvent = (rawLog) => {
    /**
     * Parses the log data from a transaction receipt into a wallet event
     * Sample input:
     * {
        transactionIndex: 0,
        blockNumber: 2,
        transactionHash: '0x3505400ac96d7165ba95252f54c3dcbe46436efd9d25ef031dd6fb5c40968506',
        address: '0x5FbDB2315678afecb367f032d93F642f64180aa3',
        topics: [],
        data: '0x000000000000000000000001f39fd6e51aad88f6f4ce6ab8827279cfffb922660000000000000000000000000000000000000000000000004563918244f400000000000000000000000000000000000000000000000000004563918244f40000',
        logIndex: 0,
        blockHash: '0x18447452df8df7611b9c6fae418adbf414fbd1b97e3dd6f6f74a79e3514ae308'
     * }
     * Sample output:
     * {
        name: 'Deposit',
        address: 'f39fd6e51aad88f6f4ce6ab8827279cfffb92266',
        deposited: '0000000000000000000000000000000000000000000000004563918244f40000',
        available: '0000000000000000000000000000000000000000000000004563918244f40000'
     * }
     */

    // Slice the data 
    const identifier = rawLog.data.slice(25, 26);
    const address = rawLog.data.slice(26, 66);
    const amount = rawLog.data.slice(66, 130);
    const balance = rawLog.data.slice(130, 194);
    if (identifier === "1") {
        return {
            name: "Deposit",
            address,
            deposited: amount,
            available: balance
        };
    } else if (identifier === "2") {
        return {
            name: "Withdrawal",
            address,
            withdrawan: amount,
            remaining: balance
        };
    } else {
        throw "Invalid identifier";
    }
}

describe("Wallet2", () => {
    let signers;
    let wallet2;
    
    beforeEach(async () => {
        signers = await ethers.getSigners();
        const walletFactory = await ethers.getContractFactory("Wallet2");
        wallet2 = await walletFactory.deploy();
        await wallet2.deployed();
    });

    describe("deposit", () => {
        it("should add to the balance", async () => {
            const tx = await wallet2.connect(signers[0]).deposit({ value: ethers.utils.parseEther("1.0") });
            const receipt = await tx.wait();
            const event = getWalletEvent(receipt.logs[0]);
            expect(event.name).to.equal("Deposit");
            expect(ethers.utils.getAddress(`0x${event.address}`)).to.equal(signers[0].address);
            expect(BigNumber.from(`0x${event.deposited}`)).to.equal(ethers.utils.parseEther("1.0"));
            expect(BigNumber.from(`0x${event.available}`)).to.equal(ethers.utils.parseEther("1.0"));
        });
    });

    describe("withdraw", async () => {
        beforeEach(async () => {
            await wallet2.connect(signers[0]).deposit({ value: ethers.utils.parseEther("5.0") });
        });

        it("should decrease balance and transfer funds to caller", async () => {
            const tx = await wallet2.connect(signers[0]).withdraw(ethers.utils.parseEther("3.0"));
            const receipt = await tx.wait();
            console.log(receipt);
            expect(await wallet2.getBalance(signers[0].address)).to.equal(ethers.utils.parseEther("2.0"));
            const event = getWalletEvent(receipt.logs[0]);
            expect(event.name).to.equal("Withdrawal");
            expect(ethers.utils.getAddress(`0x${event.address}`)).to.equal(signers[0].address);
            expect(BigNumber.from(`0x${event.withdrawan}`)).to.equal(ethers.utils.parseEther("3.0"));
            expect(BigNumber.from(`0x${event.remaining}`)).to.equal(ethers.utils.parseEther("2.0"));
        });

        it("should revert for withdrawal amount larger than caller's balance", async () => {
            await expect(
                wallet2.connect(signers[0]).withdraw(ethers.utils.parseEther("10.0"))
            ).to.be.revertedWith("insufficient balance");
        });
    });

    describe("compare gas", () => {
        let wallet1;
        beforeEach(async () => {
            const walletFactory = await ethers.getContractFactory("Wallet");
            wallet1 = await walletFactory.deploy();
            await wallet1.deployed();
            await wallet1.connect(signers[0]).deposit({ value: ethers.utils.parseEther("10.0") });
            await wallet2.connect(signers[0]).deposit({ value: ethers.utils.parseEther("10.0") });
        });

        it("should be cheaper to deposit with wallet2 than wallet1", async () => {
            const tx1 = await wallet1.connect(signers[0]).deposit({ value: ethers.utils.parseEther("5.0") });
            const receipt1 = await tx1.wait();
            const tx2 = await wallet2.connect(signers[0]).deposit({ value: ethers.utils.parseEther("5.0") });
            const receipt2 = await tx2.wait();
            console.log(`WALLET1 DEPOSIT GAS USED: ${receipt1.gasUsed}`);
            console.log(`WALLET2 DEPOSIT GAS USED: ${receipt2.gasUsed}`);
            console.log(`GAS DIFFERENCE: ${receipt1.gasUsed.sub(receipt2.gasUsed)}`)
            expect(receipt1.gasUsed > receipt2.gasUsed).to.be.true;
        });

        it("should be cheaper to withdraw with wallet2 than wallet1", async () => {
            const tx1 = await wallet1.connect(signers[0]).withdraw(ethers.utils.parseEther("5.0"));
            const receipt1 = await tx1.wait();
            const tx2 = await wallet2.connect(signers[0]).withdraw(ethers.utils.parseEther("5.0"));
            const receipt2 = await tx2.wait();
            console.log(`WALLET1 WITHDRAW GAS USED: ${receipt1.gasUsed}`);
            console.log(`WALLET2 WITHDRAW GAS USED: ${receipt2.gasUsed}`);
            console.log(`GAS DIFFERENCE: ${receipt1.gasUsed.sub(receipt2.gasUsed)}`)
            expect(receipt1.gasUsed > receipt2.gasUsed).to.be.true;
        });
    });
});