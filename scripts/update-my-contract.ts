(async()=>{
    const address = "0x45373635641f5C51bf1029FdF2A225674D61AD45"; //contract address after deploying the contract
    const abiArray = [
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_updateString",
				"type": "string"
			}
		],
		"name": "updateOurString",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "ourString",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]; // contract ABI Array after deploying the contract, copying the ABI from compilation details or ABI in the compiler section

    const contractInstance = new web3.eth.Contract(abiArray, address);
    console.log(await contractInstance.methods.ourString().call()); //the methods lists all methods including the public variables in this contract
    let accounts = await web3.eth.getAccounts();
    let txtResult = await contractInstance.methods.updateOurString("Hi, Nice.").send({from: accounts[0]})

    console.log(await contractInstance.methods.ourString().call());
    console.log(txtResult)

})() 