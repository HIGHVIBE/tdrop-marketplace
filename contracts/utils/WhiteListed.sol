pragma solidity >=0.8.0;


import "./Ownable.sol";

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract WhiteListed is Ownable {
   
    // @notice whitelist address map
    mapping(address => bool) private whitelist;

    // @dev Emitted when an address has added to whitelist or has removed from its
    // @dev status: 0 - removed, 1 - added
    event WhitelistEvent(address addr, uint256 status, string eventText);

    // @dev Throws if called by any account that's not whitelisted
    // @dev The Developer address has access to whitelist functions by default
    modifier onlyWhitelisted() {
        require(whitelist[msg.sender] || owner == msg.sender);
        _;
    }

    // @dev Add an address to the whitelist
    // @param addr address
    // @return true if the address was added to the whitelist, false if the address was already in the whitelist
    function addAddressToWhitelist(address addr) external onlyOwner returns(bool success) {
        if (!whitelist[addr]) {
            whitelist[addr] = true;
            emit WhitelistEvent(addr, 1, "The address has been added to Whitelist");
            success = true;
        }
    }

    // @dev Remove an address from the whitelist
    // @param addr address
    // @return true if the address was removed from the whitelist, 
    // false if the address wasn't in the whitelist in the first place
    function removeAddressFromWhitelist(address addr) external onlyOwner returns(bool success) {
        success = false;
        if (whitelist[addr]) {
            whitelist[addr] = false;
            emit WhitelistEvent(addr, 0, "The address has been deleted from Whitelist");
            success = true;
        }
    }

    // @dev Check whitelist address
    // @param addr address
    // @return true if the address is in the whitelist
    function isWhitelistAddress(address addr) public view returns (bool success) {
        return whitelist[addr];
    }
}
