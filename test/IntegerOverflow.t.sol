
// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
pragma abicoder v2;

import "forge-std/Test.sol";
import "../src/IntegerOverflow.sol";

contract OverflowTest is Test {
    Overflow overflowContract;

    function setUp() public {
        overflowContract = new Overflow();
    }

    function testOverflowExploit() public {
        uint maxUint = type(uint).max;
        uint valueToAdd = 1;

        // Add maxUint to the sellerBalance
        bool success = overflowContract.add(maxUint);
        assertTrue(success, "Initial add failed");

        // This addition should cause an overflow
        success = overflowContract.add(valueToAdd);
        assertTrue(success, "Overflow add failed");
    }
}
