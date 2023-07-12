const erc20 = artifacts.require("erc20");

// erc 20 배포
module.exports = function (deployer) {
  const name = "JongGu";
  const symbol = "JG";
  const decimals = 18;
  const totalSupply = "10000000000000000000000000"; //10^25 => 10000000JG

  deployer.deploy(erc20, name, symbol, decimals, totalSupply);
};
