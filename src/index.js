// Import necessary dependencies and web3.js configuration
const Web3 = require("web3");
const PandlesNFT = require("../build/contracts/PandlesNFT.json");

// Configure web3 provider
const web3 = new Web3("http://localhost:8545"); // Replace with your network's RPC URL

// Create an instance of the contract
const contractInstance = new web3.eth.Contract(
    PandlesNFT.abi,
    "0xContractAddress" // Replace with your deployed contract's address
);

// Example usage: Mint an NFT
async function mintNFT() {
    const recipientAddress = "0xRecipientAddress"; // Replace with the recipient's Ethereum address
    const name = "My NFT";
    const description = "An example NFT";
    const imageURI = "https://example.com/image.png";
    const price = web3.utils.toWei("0.01", "ether"); // Convert price to wei

    await contractInstance.methods
        .mintNFT(recipientAddress, name, description, imageURI, price)
        .send({ from: "0x0C512441E324BF81DA5e6296B8fD4f2B07e34715" }); // Replace with your Ethereum address

    console.log("NFT minted successfully!");
}

// Call the example function
mintNFT();
