
const Payment = artifacts.require('Payment');


contract('Payment',()=>{

    it('Merchant will create price ',async()=>{
        const paymentcontract= await Payment.deployed();
        await paymentcontract.Createprice(20000,3);
        
    });

    it('Buyer pays the price',async()=>{
        const paymentcontract= await Payment.deployed();
        await paymentcontract.pay(3,{value:20000});
        const balance = await web3.eth.getBalance(paymentcontract.address);
        assert.equal(balance, 20000,"Not equal");


    });

      it('Merchant withraws money',async()=>{
        const paymentcontract= await Payment.deployed();
        await paymentcontract.Withdraw();
        let sales = await paymentcontract.sales();
        console.log(sales.toNumber());
        assert.equal(sales,0,"Not Equal" )
      })
});

