
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import "src/Counter.sol";

contract  AddressGenerator is Test {
//this code only works in a foundry project. It was done outside this project and then pasted here for reference only
//on how i generated the addresses in my csv file

    function setUp() public {
      
    }

    function testGenerateAddress() public {
        address alice = makeAddr("alice");
        emit log_address(alice); // 0x328809bc894f92807417d2dad6b7c998c1afdac6
        address bob = makeAddr("bob");
        emit log_address(bob); // 0x328809bc894f92807417d2dad6b7c998c1afdac6
        address jat = makeAddr("jat");
        emit log_address(jat); // 0x328809bc894f92807417d2dad6b7c998c1afdac6
        address claire = makeAddr("claire");
        emit log_address(claire); // 0x328809bc894f92807417d2dad6b7c998c1afdac6
        address vic = makeAddr("vic");
        emit log_address(vic); // 0x328809bc894f92807417d2dad6b7c998c1afdac6
        address jesse = makeAddr("jesse");
        emit log_address(jesse); // 0x328809bc894f92807417d2dad6b7c998c1afdac6
        address odion = makeAddr("odion");
        emit log_address(odion); // 0x328809bc894f92807417d2dad6b7c998c1afdac6
    }

}
