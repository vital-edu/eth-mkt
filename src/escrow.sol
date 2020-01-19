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

  function approve() public {
    require(
      msg.sender == arbiter,
      "Only the arbiter can approve the transaction"
    );
    emit Approve(address(this).balance);
    payable(beneficiary).transfer(address(this).balance);
  }

  event Approve(uint balance);
}
