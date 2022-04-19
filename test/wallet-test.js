const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Wallet", () => {
    let signers;
    let walletContract;
    
    beforeEach(async () => {
        signers = await ethers.getSigners();
        const walletFactory = await ethers.getContractFactory("Wallet");
        walletContract = await walletFactory.deploy();
        await walletContract.deployed();
    });

    describe("deposit", () => {
        beforeEach(async () => {
            await walletContract.connect(signers[0]).deposit({ value: ethers.utils.parseEther("5.0") })
        });

        it("should add to the balance", async () => {
            expect(await walletContract.getBalance(signers[0].address)).to.equal(ethers.utils.parseEther("5.0"));
            const tx = await walletContract.connect(signers[0]).deposit({ value: ethers.utils.parseEther("1.0") });
            expect(await walletContract.getBalance(signers[0].address)).to.equal(ethers.utils.parseEther("6.0"));
            await expect(tx).to.emit(walletContract, "Deposit").withArgs(
                signers[0].address,
                ethers.utils.parseEther("1.0"),
                ethers.utils.parseEther("6.0")
            );
        });
    });

    describe("withdraw", () => {
        beforeEach(async () => {
            await walletContract.connect(signers[0]).deposit({ value: ethers.utils.parseEther("5.0") });
        });

        it("should decrease balance and transfer funds to caller", async () => {
            const tx = await walletContract.connect(signers[0]).withdraw(ethers.utils.parseEther("3.0"));
            expect(await walletContract.getBalance(signers[0].address)).to.equal(ethers.utils.parseEther("2.0"));
            await expect(tx).to.emit(walletContract, "Withdrawal").withArgs(
                signers[0].address,
                ethers.utils.parseEther("3.0"),
                ethers.utils.parseEther("2.0")
            );
        });

        it("should revert for withdrawal amount larger than caller's balance", async () => {
            await expect(
                walletContract.connect(signers[0]).withdraw(ethers.utils.parseEther("10.0"))
            ).to.be.revertedWith("insufficient balance");
        });
    });

});