// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract sarit_Token{
    string public tokenName = "Sarit Token";
    string public Symbol = "SRT";
    uint public SRTSupply = 0;
    uint public totalMintedSRT = 0;
    uint public totalBurnedSRT = 0;
    uint public SRT_Turnover = 0 ;
    address Tokenowner;

    mapping(address => uint) balance;

    constructor(){
        Tokenowner = msg.sender;
    }

    function SRTBalance() external view returns (uint){
        return balance[msg.sender];
    }

    function MintSRT(uint _amount) public  {
        require(msg.sender == Tokenowner,"You are not the owner , You can't mint Token");
        balance[msg.sender] += _amount;
        SRTSupply += _amount;
        totalMintedSRT += _amount;
        
    }

     function BurnSRT(uint _amount) public  {
        if(balance[msg.sender] >= _amount){
        balance[msg.sender] -= _amount;
        SRTSupply -= _amount;
        totalBurnedSRT += _amount;
        }
    }

    function SendSRT(address _address, uint _amount) public{
        require(balance[msg.sender] >= _amount,"Insufficient balance in the account , can't transfer");
        balance[_address] += _amount;
        balance[msg.sender] -= _amount;
        SRTSupply -= _amount;
        
    }

    function turnover() external returns(uint){
        SRT_Turnover = totalBurnedSRT + totalMintedSRT;
        return SRT_Turnover;
    }
}
