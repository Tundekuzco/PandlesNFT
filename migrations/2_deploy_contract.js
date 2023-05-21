const PandlesNFT = artifacts.require("PandlesNFT");

module.exports = function (deployer) {
    deployer.deploy(PandlesNFT, "PandlesNFT", "PNFT");
};
