Physical Attributes Smart Contracts
Overview
This project consists of two Solidity contracts:

1.PhysicalAttributes.sol
2.PhysicalAttributesFactory.sol

The PhysicalAttributes contract allows for storing and retrieving the physical attributes of individuals (male and female). The PhysicalAttributesFactory contract provides a factory pattern to deploy and manage multiple instances of PhysicalAttributes.

-Features:
.Add Physical Attributes: Store details such as age, weight, height, and name.
.Role-based Validation: Ensures attributes are categorized correctly by gender.
.Factory Pattern: Deploy and manage multiple PhysicalAttributes contracts.


-Installation:

1.Clone the repository:

```bash
git clone <repository-url>  
cd <repository-name>
```
2.Install dependencies:
Use a Solidity development environment such as Foundry or Hardhat.

3.Compile the contracts:

```bash
forge build  # If using Foundry
```

-Usage
Deploy Factory Contract

1. Deploy ```PhysicalAttributesFactory```.
Call ```createPhysicalAttributesContract``` to deploy a new instance of ```PhysicalAttributes```.

-Add and Retrieve Attributes

.Use addMalePhysicalAttributes and addFemalePhysicalAttributes to add data.
.Retrieve stored attributes via getListOfMale and getListOfFemale.

Example:

```solidity
PhysicalAttributesFactory factory = new PhysicalAttributesFactory();  
factory.createPhysicalAttributesContract();  
factory.addMalePhysicalAttributes(0, 30, 75, 180, "John Doe", true);
```

-License

This project is licensed under the MIT License. See the LICENSE file for details.

-Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

-Contact

For any inquiries, reach out via [xvdevlabs@gmail.com].
