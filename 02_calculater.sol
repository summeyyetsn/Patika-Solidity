// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Calculater{

    uint public mulResult;
    uint public divResult;

    function sum(uint num1, uint num2) public pure returns (uint){
        uint result = num1 + num2;
        return result;
    }
    
    function sub(uint num1, uint num2) public pure returns (uint){
        uint result = num1 - num2;
        return result;
    }

    function mul(uint num1, uint num2) public{
        mulResult = num1 * num2;
    }

    function div(uint num1, uint num2) public{
        divResult = num1 / num2;
    }
}