// SPDX-License-Identifier: MIT
pragma solidity =0.8.19;

import {DeployScript, Deployer} from "forge-deploy/DeployScript.sol";
import {DeployerFunctions} from "@generated/deployer/DeployerFunctions.g.sol";

import {IAddressTable} from "@solid-grinder/interfaces/IAddressTable.sol";

import {UniswapV2Router02_Optimized} from "@main/UniswapV2Router02_Optimized.sol";

contract DeployUniswapV2Router02_OptimizedScript is DeployScript {
    using DeployerFunctions for Deployer;

    address addressTable;

    function deploy() external returns (UniswapV2Router02_Optimized) {

        addressTable = deployer.getAddress("AddressTable");

        return UniswapV2Router02_Optimized(deployer.deploy_UniswapV2Router02_Optimized("UniswapV2Router02_Optimized", address(0), address(0), IAddressTable(addressTable) ));
    }
}
