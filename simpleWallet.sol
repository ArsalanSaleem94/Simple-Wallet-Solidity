pragma solidity ^0.4.19;

import "github.com/ethereum/solidity/std/mortal.sol";

contract simpleWallet is mortal{
    
    mapping(address => Permission) myAddressMapping;
    
    struct Permission{
        bool isAllowed;
        uint maxTransferAmount;
    }
    
    event someoneAddedSomeoneToTheSendersList(address thePersonWhoAdded, address thePersonWhoGotAdded, uint thisMuchHeCanSend);
    
    
    function addAddressToSendersList(address permitted, uint maxTransferAmount) onlyowner {
        myAddressMapping[permitted] = Permission(true, maxTransferAmount);
        someoneAddedSomeoneToTheSendersList(msg.sender, permitted, maxTransferAmount);
        
    }
    function removeAddressFromSendersList(address removeAddress) onlyowner {
        //myAddressMapping[removeAddress] = Permission(false, 0);
        delete myAddressMapping[removeAddress];
    }
    
    function sendFunds(address receiver, uint amountInWei)
    {
        if(myAddressMapping[msg.sender].isAllowed){
            if(myAddressMapping[msg.sender].maxTransferAmount >= amountInWei){
                bool isSuccessful = receiver.send(amountInWei);
                if(!isSuccessful){
                    throw;
                }
                
            }
        }
    }
    function () payable{
        
    }
    
    function getBalance() constant returns (uint) {
        return this.balance;
    }
}