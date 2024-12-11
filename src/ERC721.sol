// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyTokenERC721 is ERC721 {
    constructor() ERC721("MyToken", "MTK") {}

    function mint(address to, uint256 tokenId) external {
        _mint(to, tokenId);
    }

    function safeMint(address to, uint256 tokenId) external {
        _safeMint(to, tokenId);
    }

    function safeMint(address to, uint256 tokenId, bytes memory data) external {
        _safeMint(to, tokenId, data);
    }

    function burn(uint256 tokenId) external {
        _burn(tokenId);
    }

    // Add unsafeOwnerOf function
    function unsafeOwnerOf(uint256 tokenId) external view returns (address) {
        return _ownerOf(tokenId);
    }

    // Add unsafeGetApproved function
    function unsafeGetApproved(uint256 tokenId) external view returns (address) {
        return _getApproved(tokenId);
    }
}
