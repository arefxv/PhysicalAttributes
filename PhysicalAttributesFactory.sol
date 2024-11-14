// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {PhysicalAttributes} from "./PhysicalAttributes.sol";

contract PhysicalAttributesFactory{
    PhysicalAttributes[] public listOfPhysicalAttributesContracts;

    function createPhysicalAttributesContract() public {
        PhysicalAttributes physicalAttributes = new PhysicalAttributes();
        listOfPhysicalAttributesContracts.push(physicalAttributes);
    }

    function callMyPhysicalAttributes
    (
        uint256 _contractIndex,
        uint256 _age, 
        uint256 _weightInKg,
        uint256 _heightInCm, 
        string memory _name, 
        bool _isMale, 
        bool _isFemale
        ) 
        public {
        PhysicalAttributes newPhysicalAttributes = listOfPhysicalAttributesContracts[_contractIndex];
        newPhysicalAttributes.myPhysicalAttributes(_age, _weightInKg, _heightInCm, _name, _isMale, _isFemale);
    }
    
    function addMalePhysicalAttributes
    (
        uint256 _contractIndex, 
        uint256 _age, 
        uint256 _weightInKg, 
        uint256 _heightInCm, 
        string memory _name, 
        bool _isMale
        ) 
        public {
        PhysicalAttributes newPhysicalAttributes = listOfPhysicalAttributesContracts[_contractIndex];
        newPhysicalAttributes.addMalePA(_age, _weightInKg, _heightInCm, _name, _isMale);
    }

    function addFemalePhysicalAttributes
    (
        uint256 _contractIndex, 
        uint256 _age, 
        uint256 _weightInKg, 
        uint256 _heightInCm, 
        string memory _name, 
        bool _isFemale
        ) 
        public {
        listOfPhysicalAttributesContracts[_contractIndex].addFemalePA(_age, _weightInKg, _heightInCm, _name, _isFemale);
    }

    function getPhysicalAttributes(uint256 _contractIndex) public view returns 
    (
        uint256, 
        uint256, 
        uint256, 
        string memory, 
        bool, 
        bool
        )
        {
        return listOfPhysicalAttributesContracts[_contractIndex].getMyPhysicalAttributes();

    }


    function getListOfMale(uint256 _contractIndex, uint256 index) public view returns 
    (
        uint256, 
        uint256, 
        uint256, 
        string memory, 
        bool
        )
        {
        return listOfPhysicalAttributesContracts[_contractIndex].getMalePhysicalAttributes(index);
    }

    function getListOfFemale(uint256 _contractIndex, uint256 index) public view returns 
    (
        uint256,
        uint256, 
        uint256, 
        string memory, 
        bool
        )
        {
        return listOfPhysicalAttributesContracts[_contractIndex].getFemalePhysicalAttributes(index);
    }
}