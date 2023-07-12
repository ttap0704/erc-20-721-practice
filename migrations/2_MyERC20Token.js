const openErc20 = artifacts.require("openErc20");

// erc 20 배포
module.exports = function (deployer) {
  deployer.deploy(openErc20);
};
