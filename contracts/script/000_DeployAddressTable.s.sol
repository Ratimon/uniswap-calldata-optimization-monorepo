// SPDX-License-Identifier: MIT
pragma solidity =0.8.19;

import {DeployScript, Deployer} from "forge-deploy/DeployScript.sol";
import {DeployerFunctions} from "@generated/deployer/DeployerFunctions.g.sol";

import {AddressTable} from "@main/AddressTable.sol";

contract DeployAddressTableScript is DeployScript {
    using DeployerFunctions for Deployer;

    function deploy() external returns (AddressTable) {
        return AddressTable(deployer.deploy_AddressTable("AddressTable"));
    }
}
