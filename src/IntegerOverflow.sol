pragma solidity ^0.7.0;

contract Overflow {
    uint private sellerBalance = 0;
    
    // Function that allows overflow
    function add(uint value) public returns (bool) {
        sellerBalance += value;
        return true;
    } 

    // Function that prevents overflow using a require check
    function safe_add(uint value) public returns (bool) {
        require(value + sellerBalance >= sellerBalance, "Integer overflow");
        sellerBalance += value;
        return true;
    } 
}