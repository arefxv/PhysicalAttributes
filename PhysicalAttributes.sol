//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract PhysicalAttributes{

    error physicalAttributes__itIsMalePhysicalAttributes();
    error physicalAttributes__itIsFemalePhysicalAttributes();

    uint256 s_age;
    uint256 s_weightInKg;
    uint256 s_heightInCm;
    string s_name;
    bool isMale;
    bool isFemale;

    struct Male{
        uint256 age;
        uint256 weightInKg;
        uint256 heightInCm;
        string name;
        bool isMale;
    }

    struct Female{
        uint256 age;
        uint256 weightInKg;
        uint256 heightInCm;
        string name;
        bool isFemale;
    }

    Male[] public listOfMalePhysicalAttributes;
    Female[] public listOfFemalPhysicalAttributes;
    mapping(string => bool maleStatusIs) public nameToMaleGender;
    mapping(string => bool femaleStatusIs) public nameToFemaleGender;

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

    function addMalePA(
        uint256 _age, 
        uint256 _weightInKg, 
        uint256 _heightInCm, 
        string memory _name, 
        bool _isMale) public {

        if(!_isMale) {
            revert physicalAttributes__itIsMalePhysicalAttributes();
        }
        listOfMalePhysicalAttributes.push(Male(_age, _weightInKg, _heightInCm, _name, _isMale));
        nameToMaleGender[_name] = _isMale;
    }

    function addFemalePA(
        uint256 _age, 
        uint256 _weightInKg, 
        uint256 _heightInCm, 
        string memory _name, 
        bool _isFemale) public {

        if(!_isFemale){
            revert physicalAttributes__itIsFemalePhysicalAttributes();
        }
        listOfFemalPhysicalAttributes.push(Female(_age, _weightInKg, _heightInCm, _name, _isFemale));
        nameToFemaleGender[_name] = _isFemale;
    }

    function getMyPhysicalAttributes() public view returns(
        uint256, uint256, uint256, string memory, bool, bool)
        {
        return (s_age, s_weightInKg, s_heightInCm, s_name, isMale, isFemale);
    }

     function getMalePhysicalAttributes(uint256 index) public view returns (
        uint256 age, 
        uint256 weightInKg, 
        uint256 heightInCm, 
        string memory name, 
        bool _isMale
        )
        {
        if ( index < listOfMalePhysicalAttributes.length)
        return (
            listOfMalePhysicalAttributes[index].age,
            listOfMalePhysicalAttributes[index].weightInKg,
            listOfMalePhysicalAttributes[index].heightInCm,
            listOfMalePhysicalAttributes[index].name,
            listOfMalePhysicalAttributes[index].isMale
        );
    }

    function getFemalePhysicalAttributes(uint256 index) public view returns(
        uint256 age, 
        uint256 weightInKg, 
        uint256 heightInCm, 
        string memory name, 
        bool _isFemale
        )
        {
        if( index < listOfFemalPhysicalAttributes.length)
        return (
            listOfFemalPhysicalAttributes[index].age,
            listOfFemalPhysicalAttributes[index].weightInKg,
            listOfFemalPhysicalAttributes[index].heightInCm,
            listOfFemalPhysicalAttributes[index].name,
            listOfFemalPhysicalAttributes[index].isFemale
        );
    }

   
}