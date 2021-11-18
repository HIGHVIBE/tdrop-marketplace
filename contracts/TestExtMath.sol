/*

  << TestExtMath >>

*/

pragma solidity ^0.8.5;

import "./lib/ExtMath.sol";

contract TestExtMath {
    using ExtMath for uint;

    constructor () public {
    }

    function log2(uint x) public view returns (uint y) {
        return ExtMath.log2(x);
    }
}
