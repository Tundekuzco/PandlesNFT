// Import necessary dependencies and configure web3 provider
const Web3 = require("web3");

// Configure web3 provider
const web3 = new Web3("HTTP://127.0.0.1:7545"); // Replace with your network's RPC URL

module.exports = web3;
