// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Bank{

    //       Ali has 1000 $
    mapping (address => uint) balances;

    // function checkMsgSender() public view returns(address){
    //     return msg.sender; //  msg.sender = the address of user who call this function
    // }


    // function checkBlockTimestamp() public view returns(uint){
    //     return block.timestamp;  //1970 da başaltılan bir sayaç (birimi second) current timestamp.
    // }

    function deposit() public payable {      // we use this function for increase the balance
        balances[msg.sender] += msg.value;   // we use msg.value to send real ether. 
                                             // And we write the amount to be sent to the value input above the deploy button.                                   
    }
    
    function withdraw(uint _amount) public{
        require(_amount > 0, "Amount must greater than 0");
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function checkUserBalance() public view returns(uint){
        return balances[msg.sender];  
    }

    function transfer(address receiver, uint _amount) public {
        require(balances[msg.sender]>=_amount, "You do NOT have enough balance !!");
        balances[msg.sender] -= _amount;
        balances[receiver] += _amount;

    }

    function viewContractBalance() public view returns(uint){
        return address(this).balance;
    }



}