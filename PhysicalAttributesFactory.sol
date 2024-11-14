// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Import the PhysicalAttributes contract to interact with it
import {PhysicalAttributes} from "./PhysicalAttributes.sol";

contract PhysicalAttributesFactory {
    // Array to store deployed instances of PhysicalAttributes contracts
    PhysicalAttributes[] public listOfPhysicalAttributesContracts;

    // Function to create a new PhysicalAttributes contract instance
    function createPhysicalAttributesContract() public {
        // Deploy a new PhysicalAttributes contract and store its reference
        PhysicalAttributes physicalAttributes = new PhysicalAttributes();
        listOfPhysicalAttributesContracts.push(physicalAttributes);
    }

    // Function to call `myPhysicalAttributes` function on a specific PhysicalAttributes contract
    function callMyPhysicalAttributes(
        uint256 _contractIndex,
        uint256 _age, 
        uint256 _weightInKg,
        uint256 _heightInCm, 
        string memory _name, 
        bool _isMale, 
        bool _isFemale
    ) public {
        // Access the PhysicalAttributes contract at the given index
        PhysicalAttributes newPhysicalAttributes = listOfPhysicalAttributesContracts[_contractIndex];
        // Set the personal physical attributes
        newPhysicalAttributes.myPhysicalAttributes(_age, _weightInKg, _heightInCm, _name, _isMale, _isFemale);
    }

    // Function to add male physical attributes to a specific PhysicalAttributes contract
    function addMalePhysicalAttributes(
        uint256 _contractIndex, 
        uint256 _age, 
        uint256 _weightInKg, 
        uint256 _heightInCm, 
        string memory _name, 
        bool _isMale
    ) public {
        // Access the PhysicalAttributes contract at the given index
        PhysicalAttributes newPhysicalAttributes = listOfPhysicalAttributesContracts[_contractIndex];
        // Add male physical attributes to the contract
        newPhysicalAttributes.addMalePA(_age, _weightInKg, _heightInCm, _name, _isMale);
    }

    // Function to add female physical attributes to a specific PhysicalAttributes contract
    function addFemalePhysicalAttributes(
        uint256 _contractIndex, 
        uint256 _age, 
        uint256 _weightInKg, 
        uint256 _heightInCm, 
        string memory _name, 
        bool _isFemale
    ) public {
        // Access the PhysicalAttributes contract at the given index
        listOfPhysicalAttributesContracts[_contractIndex].addFemalePA(_age, _weightInKg, _heightInCm, _name, _isFemale);
    }

    // Function to retrieve physical attributes from a specific PhysicalAttributes contract
    function getPhysicalAttributes(uint256 _contractIndex) public view returns (
        uint256, 
        uint256, 
        uint256, 
        string memory, 
        bool, 
        bool
    ) {
        // Retrieve and return physical attributes from the contract
        return listOfPhysicalAttributesContracts[_contractIndex].getMyPhysicalAttributes();
    }

    // Retrieve a specific male's physical attributes from a specific contract
    function getListOfMale(uint256 _contractIndex, uint256 index) public view returns (
        uint256, 
        uint256, 
        uint256, 
        string memory, 
        bool
    ) {
        // Return male physical attributes from the contract at the specified index
        return listOfPhysicalAttributesContracts[_contractIndex].getMalePhysicalAttributes(index);
    }

    // Retrieve a specific female's physical attributes from a specific contract
    function getListOfFemale(uint256 _contractIndex, uint256 index) public view returns (
        uint256,
        uint256, 
        uint256, 
        string memory, 
        bool
    ) {
        // Return female physical attributes from the contract at the specified index
        return listOfPhysicalAttributesContracts[_contractIndex].getFemalePhysicalAttributes(index);
    }
}
