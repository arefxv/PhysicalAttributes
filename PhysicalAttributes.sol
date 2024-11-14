// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract PhysicalAttributes {

    // Custom error types for gender validation
    error physicalAttributes__itIsMalePhysicalAttributes();
    error physicalAttributes__itIsFemalePhysicalAttributes();

    // State variables to store personal attributes
    uint256 s_age;           // Age of the individual
    uint256 s_weightInKg;    // Weight of the individual in kilograms
    uint256 s_heightInCm;    // Height of the individual in centimeters
    string s_name;           // Name of the individual
    bool isMale;             // Gender flag for male
    bool isFemale;           // Gender flag for female

    // Male struct to store male-specific attributes
    struct Male {
        uint256 age;
        uint256 weightInKg;
        uint256 heightInCm;
        string name;
        bool isMale;
    }

    // Female struct to store female-specific attributes
    struct Female {
        uint256 age;
        uint256 weightInKg;
        uint256 heightInCm;
        string name;
        bool isFemale;
    }

    // Arrays to store physical attributes for males and females
    Male[] public listOfMalePhysicalAttributes;
    Female[] public listOfFemalPhysicalAttributes;

    // Mappings to verify the gender of an individual by their name
    mapping(string => bool) public nameToMaleGender;
    mapping(string => bool) public nameToFemaleGender;

    // Function to set personal physical attributes
    function myPhysicalAttributes(
        uint256 _age, 
        uint256 _weightInKg, 
        uint256 _heightInCm, 
        string memory _name, 
        bool _isMale, 
        bool _isFemale) public {
        s_age = _age;
        s_weightInKg = _weightInKg;
        s_heightInCm = _heightInCm;
        s_name = _name;
        isMale = _isMale;
        isFemale = _isFemale;
    }

    // Add male physical attributes to the list, with gender validation
    function addMalePA(
        uint256 _age, 
        uint256 _weightInKg, 
        uint256 _heightInCm, 
        string memory _name, 
        bool _isMale) public {

        // Gender check: if not male, revert with a custom error
        if(!_isMale) {
            revert physicalAttributes__itIsMalePhysicalAttributes();
        }
        // Add new male physical attributes to the list
        listOfMalePhysicalAttributes.push(Male(_age, _weightInKg, _heightInCm, _name, _isMale));
        nameToMaleGender[_name] = _isMale;
    }

    // Add female physical attributes to the list, with gender validation
    function addFemalePA(
        uint256 _age, 
        uint256 _weightInKg, 
        uint256 _heightInCm, 
        string memory _name, 
        bool _isFemale) public {

        // Gender check: if not female, revert with a custom error
        if(!_isFemale){
            revert physicalAttributes__itIsFemalePhysicalAttributes();
        }
        // Add new female physical attributes to the list
        listOfFemalPhysicalAttributes.push(Female(_age, _weightInKg, _heightInCm, _name, _isFemale));
        nameToFemaleGender[_name] = _isFemale;
    }

    // Retrieve personal physical attributes
    function getMyPhysicalAttributes() public view returns(
        uint256, uint256, uint256, string memory, bool, bool) {
        return (s_age, s_weightInKg, s_heightInCm, s_name, isMale, isFemale);
    }

    // Retrieve male physical attributes at a specific index
    function getMalePhysicalAttributes(uint256 index) public view returns (
        uint256 age, 
        uint256 weightInKg, 
        uint256 heightInCm, 
        string memory name, 
        bool _isMale
        ) {
        // Check if the provided index is within bounds
        if (index < listOfMalePhysicalAttributes.length)
            return (
                listOfMalePhysicalAttributes[index].age,
                listOfMalePhysicalAttributes[index].weightInKg,
                listOfMalePhysicalAttributes[index].heightInCm,
                listOfMalePhysicalAttributes[index].name,
                listOfMalePhysicalAttributes[index].isMale
            );
    }

    // Retrieve female physical attributes at a specific index
    function getFemalePhysicalAttributes(uint256 index) public view returns(
        uint256 age, 
        uint256 weightInKg, 
        uint256 heightInCm, 
        string memory name, 
        bool _isFemale
        ) {
        // Check if the provided index is within bounds
        if(index < listOfFemalPhysicalAttributes.length)
            return (
                listOfFemalPhysicalAttributes[index].age,
                listOfFemalPhysicalAttributes[index].weightInKg,
                listOfFemalPhysicalAttributes[index].heightInCm,
                listOfFemalPhysicalAttributes[index].name,
                listOfFemalPhysicalAttributes[index].isFemale
            );
    }

}

