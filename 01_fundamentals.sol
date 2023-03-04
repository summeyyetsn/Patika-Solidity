// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FirstContract{
    /*
    bool -> boolean : true or false. Deafult false
    int256 -> integar : Numbers poz and neg
    uint256 -> unsigned integer numbers 0- (2^255) -1
    address -> address of a wallet or a contract
    string -> char array, text
    array -> list of variables
    mapping -> list of key-value pairs

    State variables: Contract's variables and stıred contract memory. permanent
    Local variables: Function's variables. temporary.
    Global variables: Variables of blockchain, msg.sender.
    */
    int public num1 = -100; 
    bool public isTrue = true;
    int256 public ten = 10;
    uint256 public twenty = 20;
    string public myName = "Seher";

    address public contractAddress = address(this);  // contract address


    // Lists
    uint[] public numbers = [1,2,3,4,5];
    string[] public letters = ["a","b","c","d"];

    // mapping  mapping(key => value) <access specifier> <name>;
    mapping(string => uint) public nameAndAge;

    function addElement() public{
        nameAndAge["Seher"] = 28;
        nameAndAge["Saban"] = 29;
        nameAndAge["Talha"] = 17;
    }

    //addElementToMapping();

    /*................................................*/

    /*
    public : everyone or other contract reach this function
    private : just owner reach this function
    internal : 
    external : 

    pure
    view
    */
    //      ____Functions____

    function exampleFunction(uint num1) public pure returns (uint){
        return num1 * 2;
    }

    function exampleFunction1(uint num1, uint num2) public pure returns (uint){
        return num1 + num2;
    }

    function exampleFunction2(uint num1, uint num2) public pure returns (uint){
        uint num3 = num1 + num2;
        return num3;
    }

    //   ___Conditions___
    function ifElse() public pure returns (string memory){
        if(10< 20){
            return "Lower";
        }

        else{
            return "Not Lower";
        }
    }
}