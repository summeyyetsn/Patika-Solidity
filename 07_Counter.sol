// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Counter{
    /*
    increment();
    decrement();
    reset();
    getCounterValue();
    */
    uint counter;
    constructor() public {
        counter = 0;
    }

    function increment() public{
        counter += 1;
    }

    function decrement() public{
        require(counter>0, "Counter value cannot be negative");
        counter -= 1;
    } 
    
    function reset() public{
        counter = 0;
    }

    function getCounterValue() public view returns(uint){
        return counter;
    }
}