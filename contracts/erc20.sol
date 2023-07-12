// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract erc20 {
  // 트랜젝션 발생 후 이벤트 설정
  // 이벤트 발생시킬 때에는 emit 활용
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

  string public name; // 토큰 이름
  string public symbol; // 토큰 심볼
  uint8 public decimals; // 소수점 : 이더리움과 같이 18로 맞추는 것을 권장
  uint public totalSupply; // 전체 발행량

  mapping (address => uint) public balanceOf; // 토큰 보유량
  mapping (address => mapping(address => uint)) public _allowances; // transferFrom에서 전송가능한 토큰수량

  constructor (
    string memory _name,
    string memory _symbol,
    uint8 _decimals,
    uint _totalSupply
  ) {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    totalSupply = _totalSupply;

    balanceOf[msg.sender] = totalSupply;
    emit Transfer(address(this), msg.sender, totalSupply);
  }

  // 토큰 전송
  function transfer(address recipient, uint amount) public returns(bool) {
    _transfer(msg.sender, recipient, amount);
    return true;
  }

  // ~에서 토큰 전송
  function transferFrom(address sender, address recipient, uint256 amount) public returns(bool) {
    _transfer(sender, recipient, amount);
    _approve(sender, msg.sender, _allowances[sender][msg.sender] - amount);

    return true;
  }

  // 출금 수량 제한 조회
  function allowance(address owner, address spender) public view returns(uint256) {
    return _allowances[owner][spender];
  }

  // 출금 수량 제한 설정
  function approve(address spender, uint256 value) public returns(bool) {
    _approve(msg.sender, spender, value);
    return true;
  }

  function _transfer(address sender, address recipient, uint256 amount) internal {
    balanceOf[sender] -= amount;
    balanceOf[recipient] += amount;

    emit Transfer(sender, recipient, amount);
  }

  function _approve(address owner, address spender, uint256 value) internal {
    _allowances[owner][spender] = value;

    emit Approval(owner, spender, value);
  }
}