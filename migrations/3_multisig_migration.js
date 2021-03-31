// Name of the contract in build/contracts
const MultiSigWallet = artifacts.require("MultiSigWallet");

module.exports = function (deployer, network, accounts) {
  deployer.deploy(MultiSigWallet, [accounts[0], accounts[1]], 2);
};
