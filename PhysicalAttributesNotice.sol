//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {PhysicalAttributes} from "./PhysicalAttributes.sol";

contract PhysicalAttributesNote is PhysicalAttributes{

    function noticeAboutBool() public pure returns(string memory) {
        return "Set isMale/isFemale to true if you are male/female";
    }

} 