pragma solidity >=0.7.3;

contract HelloJi{
   //net money on blockchain
   uint private netFundsOnBlockchain = 0;
   uint private thresholdForFunds = 10000;      //max limit for the netFundsOnBlockchain on blockchain
   constructor() public{
   }
   function varifyLender() private pure returns(bool){
      return true;
   }
   function varifyReceiver() private pure returns(bool){
      return true;
   }
   function addFunds(uint addMoney) private{
      // check if money is needed by the blockchain or not
      if(varifyLender() && addMoney + netFundsOnBlockchain < thresholdForFunds)
         netFundsOnBlockchain+=addMoney;

   }
   function takeFunds(uint takeMoney) private{
      // check if money is present in the blockchain or not
      if(varifyReceiver() && netFundsOnBlockchain - takeMoney > 0)
         netFundsOnBlockchain-=takeMoney;
   }
   //lender
   function lender(uint coin) public{
      addFunds(coin);
   }
   //receiver 
   function receiver(uint coin ) public{
      takeFunds(coin);
   }
   //call funds
   function getValueOfBlockchain() public view returns(uint) {
      return netFundsOnBlockchain;
   }
}