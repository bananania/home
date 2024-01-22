// Create global userWalletAddress variable
window.userWalletAddress = null;

// when the browser is ready
window.onload = async (event) => {
    // check if ethereum extension is installed
    if (window.ethereum) {
        // create web3 instance
        window.web3 = new Web3(window.ethereum);
    
        // contract address
        //NFT_address = "0x12dc17440614af3571446AD7a503B909C8A5534e";
        NFT_address = "0x856015dA4A624EF1Db6435398d72CC56d4EEDf81"; // sepolia
	    // abi
        NFT_abi = [
            {"inputs":[],"stateMutability":"nonpayable","type":"constructor"},
            {"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},
            {"indexed":true,"internalType":"address","name":"approved","type":"address"},
            {"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"Approval","type":"event"},
            {"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},
            {"indexed":true,"internalType":"address","name":"operator","type":"address"},
            {"indexed":false,"internalType":"bool","name":"approved","type":"bool"}],"name":"ApprovalForAll","type":"event"},
            {"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"previousOwner","type":"address"},
            {"indexed":true,"internalType":"address","name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"},
            {"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"from","type":"address"},
            {"indexed":true,"internalType":"address","name":"to","type":"address"},
            {"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"Transfer","type":"event"},
            {"inputs":[],"name":"BanananiaHome","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},
            {"inputs":[],"name":"MAX_Bananania","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},
            {"inputs":[{"internalType":"address","name":"to","type":"address"},
            {"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"approve","outputs":[],"stateMutability":"nonpayable","type":"function"},
            {"inputs":[{"internalType":"address","name":"owner","type":"address"}],"name":"balanceOf","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},
            {"inputs":[],"name":"baseURI","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},
            {"inputs":[],"name":"flipSaleState","outputs":[],"stateMutability":"nonpayable","type":"function"},
            {"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"getApproved","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"},
            {"internalType":"address","name":"operator","type":"address"}],"name":"isApprovedForAll","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"mintBananania","outputs":[],"stateMutability":"payable","type":"function"},
            {"inputs":[],"name":"name","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},
            {"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},
            {"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"ownerOf","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"renounceOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},
            {"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},
            {"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"safeTransferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},
            {"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},
            {"internalType":"uint256","name":"tokenId","type":"uint256"},
            {"internalType":"bytes","name":"_data","type":"bytes"}],"name":"safeTransferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},
            {"inputs":[],"name":"saleIsActive","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},
            {"inputs":[{"internalType":"address","name":"operator","type":"address"},
            {"internalType":"bool","name":"approved","type":"bool"}],"name":"setApprovalForAll","outputs":[],"stateMutability":"nonpayable","type":"function"},
            {"inputs":[{"internalType":"string","name":"baseURI","type":"string"}],"name":"setBaseURI","outputs":[],"stateMutability":"nonpayable","type":"function"},
            {"inputs":[],"name":"standardBanananiaCount","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},
            {"inputs":[{"internalType":"bytes4","name":"interfaceId","type":"bytes4"}],"name":"supportsInterface","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},
            {"inputs":[],"name":"symbol","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},
            {"inputs":[{"internalType":"uint256","name":"index","type":"uint256"}],"name":"tokenByIndex","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},
            {"inputs":[{"internalType":"address","name":"owner","type":"address"},
            {"internalType":"uint256","name":"index","type":"uint256"}],"name":"tokenOfOwnerByIndex","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},
            {"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"tokenURI","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},
            {"inputs":[],"name":"totalSupply","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},
            {"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"transferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},
            {"inputs":[{"internalType":"address","name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},
            {"inputs":[],"name":"withdraw","outputs":[],"stateMutability":"nonpayable","type":"function"}       
        ];
    
        if (web3.eth.Contract) {
            // create contract instance
            contract = new web3.eth.Contract(NFT_abi, NFT_address);
        } else {
            // prompt user to check contract instance
            alert("Please check contract instance");
        }	
    } else {
        // prompt user to install Metamask
        alert("Please install MetaMask wallet");
    }

    // check if user is already logged in and update the global userWalletAddress variable
    window.userWalletAddress = window.localStorage.getItem("userWalletAddress");
        
    // show the user dashboard
    showUserDashboard();
};

// Web3 login function
const loginWithEth = async () => {
  // check if there is global window.web3 instance
  if (window.web3) {
    try {
      // get the user's ethereum account - prompts metamask to login
      const selectedAccount = await window.ethereum
        .request({
          method: "eth_requestAccounts",
        })
        .then((accounts) => accounts[0])
        .catch(() => {
          // if the user cancels the login prompt
          throw Error("Please select an account");
        });

      // set the global userWalletAddress variable to selected account
      window.userWalletAddress = selectedAccount;

      // store the user's wallet address in local storage
      window.localStorage.setItem("userWalletAddress", selectedAccount);

      // show the user dashboard
      showUserDashboard();
    } catch (error) {
      alert(error);
    }
  } else {
    alert("wallet not found");
  }
};

// function to show the user dashboard
const showUserDashboard = async () => {
  // if the user is not logged in - userWalletAddress is null
  if (!window.userWalletAddress) {

    // show the login section
    document.querySelector(".login-section").style.display = "flex";

    // hide the user dashboard section
    document.querySelector(".dashboard-section").style.display = "none";

    // return from the function
    return false;
  }

  // hide the login section
  document.querySelector(".login-section").style.display = "none";

  // show the dashboard section
  document.querySelector(".dashboard-section").style.display = "flex";

  // show the user's wallet address
  showUserWalletAddress();

  // get the user's wallet balance
  getWalletBalance();

  //getChainId();
  //getBlockNumber();
  //setCCFC_pause();  
  //getCCFC_paused();
  //getHTE_totalSupply();
  getHTE_balance();
  
};

// show the user's wallet address from the global userWalletAddress variable
const showUserWalletAddress = () => {
  const walletAddressEl = document.querySelector(".wallet-address");
  walletAddressEl.innerHTML = window.userWalletAddress;
};

const getHTE_balance = async () => {  
  // check if there is global userWalletAddress variable
  if (!window.userWalletAddress) {
    return false;
  }
  
  //
  HTE_balance = await contract.methods.balanceOf(window.userWalletAddress).call();
  HTE_balance = Number(HTE_balance).toString();

  // convert the balance to ether
  document.querySelector(".HTE-balance").innerHTML = HTE_balance;    
}

const getHTE_totalSupply = async () => {  
  // check if there is global userWalletAddress variable
  if (!window.userWalletAddress) {
    return false;
  }
  
  //
  HTE_totalSupply = await contract.methods.totalSupply().call();
  HTE_totalSupply = Number(HTE_totalSupply).toString();

  // convert the balance to ether
  document.querySelector(".HTE-totalSupply").innerHTML = HTE_totalSupply;    
}

const setCCFC_pause = async () => {
  
  // check if there is global userWalletAddress variable
  if (!window.userWalletAddress) {
    return false;
  }

  //
  //contract.methods.pause().send({ from: "0xF6Af5488D1Ad7AB03380244FD45A13C88FAcFE45", gas: "3000000" });
}

const getCCFC_paused = async () => {
  
  // check if there is global userWalletAddress variable
  if (!window.userWalletAddress) {
    return false;
  }

  //
  CCFC_paused = await contract.methods.paused().call();

  // convert the balance to ether
  document.querySelector(".CCFC-paused").innerHTML = CCFC_paused;  

}

// get the user's wallet balance
const getWalletBalance = async () => {
  
  // check if there is global userWalletAddress variable
  if (!window.userWalletAddress) {
    return false;
  }
  
  //
  walletBalance = await window.ethereum.request({
    method: "eth_getBalance",
    params: [window.userWalletAddress, "latest"]
  });
  //walletBalance -= walletBalance % 10000000000;
  walletBalance = Number(walletBalance).toString();
  walletBalance = web3.utils.fromWei(walletBalance); // wei -> ether

  // convert the balance to ether
  document.querySelector(".wallet-balance").innerHTML = walletBalance;
};

// get the chain ID
const getChainId = async () => {
  
  // check if there is global userWalletAddress variable
  if (!window.userWalletAddress) {
    return false;
  }

  //
  chainId = await window.ethereum.request({
    method: "eth_chainId",
    params: []
  });
  chainId = Number(chainId).toString();

  // convert the balance to ether
  document.querySelector(".chain-id").innerHTML = chainId;
};

// get the Block Number
const getBlockNumber = async () => {
  
  // check if there is global userWalletAddress variable
  if (!window.userWalletAddress) {
    return false;
  }

  // get the block number
  currentBLock = await window.ethereum.request({
    method: "eth_getBlockByNumber",
    params: ["latest", false]
  });
  currentBLock = Number(currentBLock.number).toString();

  // show Block Number
  document.querySelector(".block-number").innerHTML = currentBLock;
};

// web3 logout function
const logout = () => {


  // set the global userWalletAddress variable to null
  window.userWalletAddress = null;

  // remove the user's wallet address from local storage
  window.localStorage.removeItem("userWalletAddress");

  // show the user dashboard
  showUserDashboard();
};

// web3 mint function
const mint = async () => {  
    // check if there is global userWalletAddress variable
    if (!window.userWalletAddress) 
    {
        return false;
    }
    // saleIsActive
    isSaleActive = await contract.methods.saleIsActive().call();
    if (isSaleActive)
    {
    	// wallet balance
        walletBalance = await window.ethereum.request({method: "eth_getBalance", params: [window.userWalletAddress, "latest"]});
        if (walletBalance > 20000000000000000)
        {
                gas_limit = 300000;
                gas_price = await web3.eth.getGasPrice();
                //gas_price = web3.utils.toWei("30", "gwei"); // 30 Gwei gas        	
        	contract.methods.mintBananania().send({ from: window.userWalletAddress, gas: gas_limit, gasPrice: gas_price, value: web3.utils.toWei("0.02", "ether") });
        }   	
    	else
    	{
    		alert("Wallet balance is smaller then 0.02 Ether");
    	}
    }
    else
    {    	
        alert("Mint is not available now");
    }  
};

// when the user clicks the login button run the loginWithEth function
document.querySelector(".login-btn").addEventListener("click", loginWithEth);

// when the user clicks the logout button run the logout function
document.querySelector(".logout-btn").addEventListener("click", logout);

// when the user clicks the free-mint button run the pause function
//document.querySelector(".free-mint-btn").addEventListener("click", freeMint);

// when the user clicks the mint button run the pause function
document.querySelector(".mint-btn").addEventListener("click", mint);

