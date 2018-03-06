pragma solidity ^0.4.17;

contract Relay {
    address public workerContract;
    address public owner;

    function Relay(address _workerContractAddress) public {
        workerContract = _workerContractAddress;
        owner = msg.sender;
    }

    function update(address _updatedWorkerContract) public {
        if (msg.sender != owner) {
          revert();
        } else {
          workerContract = _updatedWorkerContract;
        }
    }

    function() public {
        if (!workerContract.delegatecall(msg.data)) {
          revert();
        }
    }
}