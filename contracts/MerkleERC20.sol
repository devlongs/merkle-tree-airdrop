// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract MerkleToken is ERC20 {
  bytes32 public merkle_root = 0x980f0fc604a853a631b3f39b4a3ec4607f37d5d5292c44e1c020f091c54123f1;
  mapping(address=> bool) hasMinted;
  constructor() ERC20("MerkleToken", "MERKLET") {
   
  }

  function claimToken(address user,uint amount, bytes32[] memory proof) public {
    require(!hasMinted[user],"Already claimed token"); 
    hasMinted[user] = true;
    bytes32 node = keccak256(abi.encodePacked(user,amount));
    require(
      isWhitelisted(proof, node),
      "Error: address not whitelisted"
    );

    _mint(user, amount*10**18);
  }

  function isWhitelisted(bytes32[] memory proof, bytes32 node)
    public
    view
    returns (bool)
  {
    return MerkleProof.verify(proof, merkle_root, node);
  }
}