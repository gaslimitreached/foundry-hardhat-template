// SPDX-License-Identifier: MIT
pragma solidity >=0.8.10;

import "@rari-capital/solmate/src/tokens/ERC721.sol";

contract MockNFT is ERC721("Mock NFT", "MOCK") {
	uint256 public tokenId = 1;

	function tokenURI(uint256) public pure override returns (string memory) {
		return "test";
	}

	function mint(uint count) public payable {
		count > 0 ? count : count++;
		for (uint i; i < count; i++) {
		  	_mint(msg.sender, tokenId);
			tokenId++;
		}
	}
}