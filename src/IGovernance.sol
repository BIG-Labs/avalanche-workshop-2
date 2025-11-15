// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract IGovernance{
    struct proposal{
        address proposer;
        string description;
        uint256 start;
        uint256 end;
        bool closed;
        uint256 forVotes;
        uint256 againstVotes;
    }

    
    
}
