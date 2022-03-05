// SPDX-License-Identifier: MIT
pragma solidity >=0.8.10;

interface IERC721 {
    function transferFrom(address, address, uint256) external;
}

contract Mover {
    function moveBatch(address token, uint256[] calldata tokenIds, address to) external {
        address sender = msg.sender;
        for(uint i; i < tokenIds.length; i++) {
            IERC721(token).transferFrom(sender, to, tokenIds[i]);
        }
    }
}
