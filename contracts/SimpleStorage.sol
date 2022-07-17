// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    // boolean, uint, int, address, bytes
    uint256 favoriteNumber;

    mapping(string => uint256) public nameToFavoriteNumber; // defaults to 0

    struct People {
        uint256 favoriteNumber; // idexed to 0
        string name;
    }

    People[] public people; // dunamic array
    // People[3] public people; // sized array

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    // view and pure cost no gas (unless called in a function that costs gas)
    // both do not allow modification of change
    // pure does not allow reading from the blockchain
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
    // 6 storage locations: stack, memory, storage, calldata, code, logs
    // calldata and memory only exist temporarily
    // calldata not reassignable
    // memory can be modified
    // storage (default variable type) peristent and mutable
    // types only applicable for arrays (strings), mappings or arrays not numbers e.g. uint256
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
