const { ethers } = require("hardhat");
const helpers = require("@nomicfoundation/hardhat-network-helpers");

// helpers
async function main() {

    const MERKLE_ERC20 = await ethers.getContractFactory("MerkleToken");
    const merkle_erc20 = await MERKLE_ERC20.deploy();

    await merkle_erc20.deployed();

    console.log(`merkle erc20 deployed to ${merkle_erc20.address}`);

    //user to call function
    const userOne = "0x328809Bc894f92807417D2dAD6b7C998c1aFdac6"

    const recipient = {
        leaf: "0x4f83b1304a1d21ac8c80c1ed37a7e0b7586f769db5d3d84b27d08904fe47513c",
        proof: [
            "0x750e363d96ca0feee264d7955fbdf66e97bb45826243165b5fe3c5f7cbb40a10",
            "0xf36cdec5530b9cfbfa72f382cc32aa34114d31ed056d20b93ee39626c40e37ea",
            "0x452e78c016f825a2b883ff6bfafcb5358dc85ea6bdae2623fc29dbd6df3a8887"
        ],
        amount:10
    }


    await helpers.impersonateAccount(userOne)
    const userOneSigner = await ethers.getSigner(userOne);
// console.log(userOneSigner);

const userOneFirstBalance = await merkle_erc20.balanceOf(userOne);
console.log("User one old balance\n",userOneFirstBalance.toString());


const tx = await merkle_erc20.claimToken(
      userOne,
      recipient.amount,
      recipient.proof
      );
// const tx2 = await tx.wait()
// console.log(tx2);

const userOneBalance = await merkle_erc20.balanceOf(userOne);
console.log("User one new balance\n",userOneBalance.toString());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
