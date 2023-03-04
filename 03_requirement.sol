// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract requirementSituation{
    uint num1;
    uint num2;

    /*
    Eğer requirement içindeki koşul doğru değilse yandaki mesajı verir. 
    Alt kısmı çalıştırmadan işlemi bitirir.

    Eğer requirement içindeki koşul doğruysa alt satırdaki kodları çalıştırır.
    */

    function requirement1(uint num1, uint num2) public {
        require(num1<num2,"First number is not bigger than second");
    }

    function requirement2(uint num1, uint num2) public pure returns (string memory) {
        require(num1<num2,"First number is bigger than second");
        return "Statement is TRUE";
    }
    
    uint number1;
    uint number2;

    function requirement3(uint number1, uint number2) public pure returns (uint){
        require(number1>number2, "Number1 must be greater than number2");
        uint sub = number1-number2;
        return sub;
    }
}