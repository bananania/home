// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
import "./Bananania.sol";
import "./BanananiaCoin.sol";
/*
interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

interface IERC20Metadata is IERC20 {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
}

interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

interface IERC721 is IERC165 {
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);
    function balanceOf(address owner) external view returns (uint256 balance);
    function ownerOf(uint256 tokenId) external view returns (address owner);
    function safeTransferFrom(address from, address to, uint256 tokenId) external;
    function transferFrom(address from, address to, uint256 tokenId) external;
    function approve(address to, uint256 tokenId) external;
    function getApproved(uint256 tokenId) external view returns (address operator);
    function setApprovalForAll(address operator, bool _approved) external;
    function isApprovedForAll(address owner, address operator) external view returns (bool);
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external;
}

interface IERC721Metadata is IERC721 {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function tokenURI(uint256 tokenId) external view returns (string memory);
}

abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        _transferOwnership(_msgSender());
    }

    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    function owner() public view virtual returns (address) {
        return _owner;
    }

    function _checkOwner() internal view virtual {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
    }

    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}
*/

contract NFTMarketplace {
    // contract address    
    address public ERC721Contract;
    address public ERC20Contract;   
    address public deployedAddress;

    // ID, price, onsale
    mapping(uint256 => uint256) public nftPrices;
    mapping(uint256 => bool) public isNftForSale;

    // event
    event NftListed(uint256 indexed nftId, uint256 price);
    event NftUnlisted(uint256 indexed nftId);
    event NftPurchased(address indexed buyer, uint256 indexed nftId);

    // set contract address
    constructor() {
        ERC721Contract = 0x856015dA4A624EF1Db6435398d72CC56d4EEDf81; // sepolia
        ERC20Contract = 0x7D88Df8c542A6c5D7665130d10B06AC833fd2B11; // sepolia
        deployedAddress = address(this);        
    }

    Bananania ERC721Instance = Bananania(ERC721Contract);
    BanananiaCoin ERC20Instance = BanananiaCoin(ERC20Contract);

    // list NFT
    function listNftForSale(uint256 nftId, uint256 price) external {
        require(ERC721Instance.ownerOf(nftId) == msg.sender, "You do not own this NFT");
        require(price > 0, "Price must be greater than zero");
        //require(isNftForSale[nftId] == false, "NFT is already on sale");

        nftPrices[nftId] = price;
        isNftForSale[nftId] = true;
        ERC721Instance.approve(deployedAddress, nftId);

        emit NftListed(nftId, price);
    }

    // cancel NFT
    function unlistNft(uint256 nftId) external {
        require(ERC721Instance.ownerOf(nftId) == msg.sender, "You do not own this NFT");
        require(isNftForSale[nftId], "NFT is not listed for sale");

        delete nftPrices[nftId];
        isNftForSale[nftId] = false;

        emit NftUnlisted(nftId);
    }

    // buy NFT
    function purchaseNft(uint256 nftId) external {
        require(isNftForSale[nftId], "NFT is not listed for sale");
        require(ERC20Instance.balanceOf(msg.sender) >= nftPrices[nftId] * 10 ** 18, "You do not have enough Coin");

        address seller = ERC721Instance.ownerOf(nftId);

        // transfer NFT
        ERC721Instance.safeTransferFrom(seller, msg.sender, nftId);

        // transfer Coin
        ERC20Instance.transfer(seller, nftPrices[nftId] * 10 ** 18);

        // update status
        delete nftPrices[nftId];
        isNftForSale[nftId] = false;

        emit NftPurchased(msg.sender, nftId);
    }
}
