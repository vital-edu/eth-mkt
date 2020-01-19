pragma solidity ^0.6.1;

contract MultiSig {
  address[] public owners;
  uint256 public required;

  constructor(address[] memory _owners, uint256 _required) public {
    require(_owners.length > 0, "The wallet should have at least one owner");
    require(
      _required > 0,
      "the required confirmations should be greater than 0"
    );
    require(
      _required <= _owners.length,
      "the required confirmations should not be greater than the number of owners"
    );

    owners = _owners;
    required = _required;
  }

}
