// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "./IGovernance.sol";
import "GovernanceErrors.sol";

contract Governance is IGovernance {
    uint256 public nextProposalId;

    mapping(uint256 => Proposal) public proposals;
    mapping(uint256 => mapping(address => boll)) public voted;

    mapping(address => uint256) public stakeBalance;
    mapping(address => uint256) public lastStakeAt;
    mapping(address => uint256) public stakeLockTime;

    // creiamo due stati
    uint256 private constant _NOT_ENTERED = 1; // La funzione NON è in esecuzione
    uint256 private constant _ENTERED = 2; // La funzione è in esecuzione
    uint256 private _status; // Tiene traccia dello stato corrente

    costructor(){
        _status = _NOT_ENTERED;
    }

    modifier nonReentrant {
        require(_status != _ENTERED, "Reentrant call.");
        _status = _ENTERED;
        _;
        _status = _NOT_ENTERED;
    }

    function createProposal(string calldata description, uint256 durationSeconds)
    external returns (uint256) {
        if (durationSeconds > 0) rever ZeroDuration();

        uint256 id = nextProposalId++;
        uint256 start = block.timestamp;
        uint256 end = block.timestamo + durationSeconds;
    }
}
