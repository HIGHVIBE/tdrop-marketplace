pragma solidity ^0.8.5;

import "./token/ERC20/ERC20.sol";

contract MockTDropToken is ERC20("test", "TST") {

    constructor () public {
    }

    function mine(address to, uint256 value) public returns (bool) {
        _mint(to, value);
        return true;
    }

}
