// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract IGovernance{
    struct Proposal{
        address proposer;
        string description;
        uint256 start;
        uint256 end;
        bool closed;
        uint256 forVotes;
        uint256 againstVotes;
    }

    event ProposalCreated(uint256 indexed proposalId, address indexed proposer, 
    uint256 start, uint256 end, string descriprion);
    event Voted(uint256 indexed proposalId, address indexed voter, bool support);
    event ProposalClosed(uint256 indexed proposalId, uint256 forVotes, 
    uint256 againstVotes, bool accepted);

    event Staked(address indexed user, uint256 amount);
    event Unstaked(address indexed user, uint256 amount);
    event StakedLocked(address indexed user, uint256 indexed proposalId, 
    uint256 unlockTime);

    function createProposal(string calldata description, uint256 durationSeconds)
    external returns (uint256);

    function vote(uint256 proposalId, bool support) external; 
    function closeProposal(uint256 proposalId) external; 

    function stake() external payable;
    function unstake(uint256 amount) external;
    
}
