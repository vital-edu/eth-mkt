pragma solidity ^0.6.1;

contract EscrowContract {
  address public depositor;
  address public beneficiary;
  address public arbiter;

  constructor(address _arbiter, address _beneficiary) public payable {
    arbiter = _arbiter;
    beneficiary = _beneficiary;
    depositor = msg.sender;
  }
}
