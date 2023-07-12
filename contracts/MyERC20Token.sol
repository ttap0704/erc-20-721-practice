// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract openErc20 is ERC20 {
  constructor () ERC20 ("JongGu","JG") public {
    _mint(msg.sender, 1e25);
  }

  function _beforeTokenTransfer(address from, address to, uint256 amount) internal override {

  }
}