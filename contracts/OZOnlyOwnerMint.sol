// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.14;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
contract OnlyOwnerMintWithModifier is ERC721 {
    /**
     * @dev
     * - このコントラクトをデプロイしたアドレス用変数owner
     */
    address public owner;


    constructor() ERC721("OnlyOwnerMintWithModifier", "OWNERMOD") {
        owner = _msgSender();
    }


    /**
     * @dev
     * - このコントラクトをデプロイしたアドレスだけに制御するmodifier
     */
    modifier onlyOwner {
        require(owner == _msgSender(), "Caller is not the ower.");
        _;
    }
    /**
     * @dev
     * - このコントラクトをデプロイしたアドレスだけがmint可能　onlyOwner
     * - nftMint関数の実行アドレスにtokenIdを紐付け
     */
    function nftMint(uint256 tokenId) public onlyOwner{
       _mint(_msgSender(), tokenId);
    }
}



