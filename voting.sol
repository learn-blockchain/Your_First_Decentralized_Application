pragma solidity ^0.4.11;

contract Voting {
    // store # of votes received; key = candidate; val = # votes
    mapping (bytes32 => uint8) public votesReceived;

    bytes32[] public candidateList;

    function Voting(bytes32[] candidateNames) {
        candidateList = candidateNames;
    }

    function totalVotesFor(bytes32 candidate) returns (uint8) {
        return votesReceived[candidate];
    }

    function vote(bytes32 candidate) {
        if (validCandidate(candidate) == false) {
            revert();
        }
        votesReceived[candidate] += 1;
    }

    function validCandidate(bytes32 candidate) returns (bool) {
        for (uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }

        return false;
    }
}