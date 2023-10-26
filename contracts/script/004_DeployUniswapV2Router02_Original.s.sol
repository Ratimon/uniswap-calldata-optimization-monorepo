// SPDX-License-Identifier: MIT
pragma solidity =0.8.19;

import {DeployScript, Deployer} from "forge-deploy/DeployScript.sol";
import {DeployerFunctions} from "@generated/deployer/DeployerFunctions.g.sol";

import {IAddressTable} from "@solid-grinder/interfaces/IAddressTable.sol";

import {UniswapV2Router02} from "@main/UniswapV2Router02.sol";

contract DeployUniswapV2Router04_OriginalScript is DeployScript {
    using DeployerFunctions for Deployer;

    address addressTable;

    function deploy() external returns (UniswapV2Router02) {

        addressTable = deployer.getAddress("AddressTable");

        return UniswapV2Router02(deployer.deploy_UniswapV2Router02("UniswapV2Router02", address(0), address(0) ));
    }
}
