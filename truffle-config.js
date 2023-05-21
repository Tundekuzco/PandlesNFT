module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*", // or specify the correct network ID
    },
  },
  compilers: {
    solc: {
      version: "0.8.1", // Specify the desired Solidity compiler version
    },
  },
  // Other configurations...
};
