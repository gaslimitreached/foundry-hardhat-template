// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.10;

import "ds-test/test.sol";
import "forge-std/Vm.sol";
import "./mocks/MockNFT.sol";
import "../Mover.sol";

contract User {
    receive() external payable {}
}

contract ContractTest is DSTest {
    Vm public vm = Vm(HEVM_ADDRESS);
    User internal alice;
    User internal bob;
    MockNFT internal nft;
    Mover internal mover;
    uint256[] internal tokens;

    function setUp() public {
        alice = new User();
        vm.label(address(alice), "Alice");
        bob = new User();
        vm.label(address(bob), "Bob");
        nft = new MockNFT();
        mover = new Mover();

        // mint tokens
        vm.startPrank(address(alice));
        nft.mint(2);
        // allow mover to transfer all tokens
        nft.setApprovalForAll(address(mover), true);
        vm.stopPrank();
    }

    function testBatchMove() public {
        tokens = [1, 2];
        assertOwnerOfBatch(tokens, address(alice));

        // transfer tokens to bob
        vm.prank(address(alice));
        mover.moveBatch(address(nft), tokens, address(bob));

        assertOwnerOfBatch(tokens, address(bob));
    }

    function assertOwnerOfBatch(uint[] memory batch, address owner) internal {
        for (uint i; i < batch.length; i++) {
            assertEq(nft.ownerOf(batch[i]), owner); 
        }
    }
}
