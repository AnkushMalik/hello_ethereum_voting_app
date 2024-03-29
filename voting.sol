pragma solidity ^0.4.25;
// specify what version of compiler this code will compile with

contract Voting{

    mapping (bytes32 => uint8) public votesReceived;
    /* mapping is equivalent to an associative array or hash.
    The key of the mapping is candidate name stored as type bytes32 and value is
    an unsigned integer to store the votes count
    */

    /* Solidity doesn't let you pass in an array of strings in the constructor (yet).
    We will use an array of bytes32 instead to store the list of candidates
    */
    bytes32[] public candidateList;

    constructor(bytes32[] memory candidateNames) public {
        candidateList = candidateNames;
    }

    /* ^This is the constructor which will be called once when you
    deploy the contract to the blockchain. When we deploy the contract,
    we will pass an array of candidates who will be contesting in the election
    */

    // This function returns the total votes a candidate has received so far
    function totalVotesFor(bytes32 candidate) public view returns (uint8) {
        require(validCandidate(candidate),"Invalid Candidate!");
        return votesReceived[candidate];
    }
    
    // This function increments the vote count for the specified candidate. This
    // is equivalent to casting a vote
    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate), "Invalid Candidate!");
        votesReceived[candidate]++;
    }

    // checks whether the candidate exists in candidateList array
    function validCandidate(bytes32 candidate) public view returns (bool) {
        for(uint8 i = 0; i < candidateList.length; i++){
            if (candidateList[i] == candidate) return true;
        }
        return false;   
    }
}