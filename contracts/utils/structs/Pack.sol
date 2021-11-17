pragma solidity >=0.8.4;

struct Pack {
        uint256 packId;
        uint256 nftAmount;
        uint256 packNumber;
        uint256 initialNFTId;
        uint256 saleStart;
        uint256[] saleDistributionAmounts;
        address[] saleDistributionAddresses;
        // Catalog info
        uint256 price; // in usd (1 = $0.000001)
        string serie;
        string drop;
        string packType;
        //external info
        address buyer;
    }
    