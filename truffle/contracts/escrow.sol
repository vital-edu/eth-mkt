pragma solidity ^0.6.1;

contract EscrowContract {
  address public arbiter;
  address public beneficiary;
  address public depositor;

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
    emit Approved(address(this).balance);
    payable(beneficiary).transfer(address(this).balance);
  }

  event Approved(uint _balance );
}
