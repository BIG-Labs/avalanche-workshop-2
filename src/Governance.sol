// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "./IGovernance.sol";

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
}
