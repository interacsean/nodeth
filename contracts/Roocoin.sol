pragma solidity ^0.4.17;

import "./BasicToken.sol";

contract Roo is BasicToken {

  address public admin;
  mapping (bytes32 => uint32) benefitCosts;
  mapping (address => mapping ())
  uint public newPlayerAllocation;

  function Roo(uint _newPlayerAllocation) public {
    admin = msg.sender;
    newPlayerAllocation = _newPlayerAllocation;
  }


  /**
   * Admin can add a new player to the game
   */
  function addPlayer(address _playerAddress) public {
    require (msg.sender == admin);
    // TODO: check player doesn't already exist
    balances[_playerAddress] = newPlayerAllocation;
  }

  /**
   * Admin can set the cost of a benefit
   * TODO: take a struct to set multiple
   */
  function setBenefitCost(bytes32 _benefitName, uint32 _benefitCost) public {
    require (msg.sender == admin);
    benefitCosts[_benefitName] = _benefitCost;
  }

  /**
   * Admin can set the cost of a benefit
   * TODO: take a struct to set multiple
   */
  function setBenefitsCost(bytes32 _benefitName, uint32 _benefitCost) public {
    require (msg.sender == admin);
    // benefitCosts[_benefitName] = _benefitCost;
  }

  

  // TODO: To code out for ERC20 implementation:

  // function allowance(address owner, address spender) public view returns (uint256);
  // function transferFrom(address from, address to, uint256 value) public returns (bool);
  // function approve(address spender, uint256 value) public returns (bool);
}

