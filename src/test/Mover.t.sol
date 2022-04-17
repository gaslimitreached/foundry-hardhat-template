// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.10;

import "forge-std/Test.sol";
import "./mocks/MockNFT.sol";
import "../Mover.sol";

contract ContractTest is Test {
    MockNFT internal nft;
    Mover internal mover;
    uint256[] internal tokens;

    function setUp() public {
        vm.label(address(0xA71CE), "Alice");
        vm.label(address(0xB0B), "Bob");
        nft = new MockNFT();
        mover = new Mover();

        // mint tokens
        vm.startPrank(address(0xA71CE));
        nft.mint(2);
        // allow mover to transfer all tokens
        nft.setApprovalForAll(address(mover), true);
        vm.stopPrank();
    }

    function testBatchMove() public {
        tokens = [1, 2];
        assertOwnerOfBatch(tokens, address(0xA71CE));

        // transfer tokens to bob
        vm.prank(address(0xA71CE));
        mover.moveBatch(address(nft), tokens, address(0xB0B));

        assertOwnerOfBatch(tokens, address(0xB0B));
    }

    function assertOwnerOfBatch(uint[] memory batch, address owner) internal {
        for (uint i; i < batch.length; i++) {
            assertEq(nft.ownerOf(batch[i]), owner); 
        }
    }
}
