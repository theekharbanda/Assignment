pragma solidity >=0.7.0 <0.9.0;

// SPDX-License-Identifier: MIT

contract Payment{

    address public  merchant;
    uint256 public price;
    address public buyer ;
    uint public sales ;
    mapping (uint=>uint) public id_to_price;
    

    
    constructor(){
        merchant = msg.sender;
    }

    modifier onlyMerchant() {
        require(msg.sender== merchant,"You are not the merchant");
        _;
    }

    function Createprice (uint _price, uint _id) public onlyMerchant  {
        id_to_price[_id]= _price;
    }

    function pay(uint _id) public payable {
        require(msg.value == id_to_price[_id]   , "Not paid enough" );
        sales += msg.value ;
    }

    function Withdraw() public onlyMerchant{
       payable (merchant).transfer(address(this).balance);
       sales = 0 ;
    }
}

