// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "hardhat/console.sol";

contract NFT is ERC721URIStorage {
    // Counters라는 라이브러리를 사용
    using Counters for Counters.Counter;
    // 1씩 증가하는 tokenId, 토큰 식별자
    Counters.Counter private _tokenIds;
    // 마켓플레이스의 주소 : nft와 상호작용 하는
    address contractAddress;

    // ERC721에 정의되어있는 생성자 사용, 토큰 이름과 심볼 정의, marketplaceAddress는 deploy할때 전달
    constructor(address marketplaceAddress) ERC721("Metaverse Tokens", "METT") {
        contractAddress = marketplaceAddress;
    }

    // 새로운 토큰을 발행한다
    function createToken(string memory tokenURI) public returns (uint) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        // 호출자에게 토큰을 할당
        _mint(msg.sender, newItemId);
        // 토큰에 연결된 메타데이터 주소 설정
        _setTokenURI(newItemId, tokenURI);
        // 마켓플레이스 컨트랙트가 호출자(이 컨트랙트)의 모든 토큰에 대해 동작할 권한을 부여
        setApprovalForAll(contractAddress, true);
        return newItemId;
    }
}