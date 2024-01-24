// Create global userWalletAddress variable
window.userWalletAddress = null;

//================================
// when the browser is ready
//================================
window.onload = async (event) => {
	// contract address
    HTE_address = "0xC40417C65306dC5fF11A62578EF56f3006124Ab3";
    //HTE_address = "0x7D88Df8c542A6c5D7665130d10B06AC833fd2B11"; // sepolia
	// abi
    HTE_abi = [
        {"inputs":[],"stateMutability":"nonpayable","type":"constructor"},
        {"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},
        {"indexed":true,"internalType":"address","name":"spender","type":"address"},
        {"indexed":false,"internalType":"uint256","name":"value","type":"uint256"}],"name":"Approval","type":"event"},
        {"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"previousOwner","type":"address"},
        {"indexed":true,"internalType":"address","name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"},
        {"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"from","type":"address"},
        {"indexed":true,"internalType":"address","name":"to","type":"address"},
        {"indexed":false,"internalType":"uint256","name":"value","type":"uint256"}],"name":"Transfer","type":"event"},
        {"inputs":[],"name":"BanananiaHome","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},
        {"inputs":[],"name":"airDrop","outputs":[],"stateMutability":"payable","type":"function"},
        {"inputs":[{"internalType":"address","name":"owner","type":"address"},
        {"internalType":"address","name":"spender","type":"address"}],"name":"allowance","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},
        {"inputs":[{"internalType":"address","name":"spender","type":"address"},
        {"internalType":"uint256","name":"amount","type":"uint256"}],"name":"approve","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},
        {"inputs":[{"internalType":"address","name":"account","type":"address"}],"name":"balanceOf","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},
        {"inputs":[],"name":"decimals","outputs":[{"internalType":"uint8","name":"","type":"uint8"}],"stateMutability":"view","type":"function"},
        {"inputs":[{"internalType":"address","name":"spender","type":"address"},
        {"internalType":"uint256","name":"subtractedValue","type":"uint256"}],"name":"decreaseAllowance","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},
        {"inputs":[{"internalType":"address","name":"spender","type":"address"},
        {"internalType":"uint256","name":"addedValue","type":"uint256"}],"name":"increaseAllowance","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},
        {"inputs":[],"name":"name","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},
        {"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},
        {"inputs":[],"name":"renounceOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"symbol","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},
        {"inputs":[],"name":"totalSupply","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},
        {"inputs":[{"internalType":"address","name":"to","type":"address"},
        {"internalType":"uint256","name":"amount","type":"uint256"}],"name":"transfer","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},
        {"inputs":[{"internalType":"address","name":"from","type":"address"},
        {"internalType":"address","name":"to","type":"address"},
        {"internalType":"uint256","name":"amount","type":"uint256"}],"name":"transferFrom","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},
        {"inputs":[{"internalType":"address","name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"}
    ];
    
	// create contract instance
    contract = new web3.eth.Contract(HTE_abi, HTE_address);
	
    // show the user dashboard
    showUserDashboard();
};

//================================
// function to show dashboard
//================================
const showUserDashboard = async () => {
	get_totalSupply();
    get_liquidity();
    get_gasPrice();
    // Initialize Snowfall
    snowStorm();
};

// get total supply
const get_totalSupply = async () => {
	HTE_totalSupply = await contract.methods.totalSupply().call();
	HTE_totalSupply -= HTE_totalSupply % 1000000000000000000;
	HTE_totalSupply = HTE_totalSupply / 1000000000000000000;
    HTE_totalSupply = Number(HTE_totalSupply).toString();
    document.querySelector(".totalSupply").innerHTML = HTE_totalSupply;
}

// get liquidity
const get_liquidity = async () => {
	HTE_liquidityAddress = "0x26d794Ce315d59147A9af042a39a9dD65BEE5855";
	//HTE_liquidityAddress = "0x2328C74A4FbA959DBC711E01176aD2e46417cb86"; // sepolia
	HTE_liquidity = await contract.methods.balanceOf(HTE_liquidityAddress).call();
	HTE_liquidity -= HTE_liquidity % 1000000000000000000;
	HTE_liquidity = HTE_liquidity / 1000000000000000000;
    HTE_liquidity = Number(HTE_liquidity).toString();
    document.querySelector(".liquidity").innerHTML = HTE_liquidity;
}

// get gas price
const get_gasPrice = async () => {
	gas_price = await web3.eth.getGasPrice();
	gas_price -= gas_price % 1000000000;
	gas_price = gas_price / 1000000000; //Gwei
    gas_price = Number(gas_price).toString();
    document.querySelector(".gasPrice").innerHTML = gas_price;
}

