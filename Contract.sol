// SPDX-License-Identifier: SEE LICENSE IN LICENSE

// version specification is a must. updated CZ to real time version control
pragma solidity >=0.8.17 <0.8.18;

contract ZombieFactory {

    // // Event is creating a new zombie w/ a unique (DNA aka traits, Name, Encoded identity)
    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16; // must be 16 digits
    uint dnaModulus = 10 ** dnaDigits; // parameters to the UINT characters
    
    // Create struct for Zombie data
    struct Zombie {
        string name;
        uint dna;
    } 
    
    // Zombie data added to public array
    Zombie[] public zombies;
    
    // Create Zombie Name and started defined randomness. private funcion
    // to push data to array
    function _createZombie(string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        emit NewZombie(id, _name, _dna);
    } 
    
    // Generating random string to private view returns. Ddefines Traits for Zombie
    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        returns random % dnaModulus;
    }

    // Completes and saves the Zombie in local memory via public default function
    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
