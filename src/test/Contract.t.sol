// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "ds-test/test.sol";
import "forge-std/Vm.sol";

contract ContractTest is DSTest {
    Vm public vm = Vm(HEVM_ADDRESS);
    function setUp() public {}

    function testExample() public {
        assertTrue(true);
    }
}
