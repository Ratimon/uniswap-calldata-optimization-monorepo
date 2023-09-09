// SPDX-License-Identifier: MIT
pragma solidity =0.8.19;

import {DeployScript, Deployer} from "forge-deploy/DeployScript.sol";
import {DeployerFunctions} from "@generated/deployer/DeployerFunctions.g.sol";

import {IAddressTable} from "@solid-grinder/interfaces/IAddressTable.sol";

import {UniswapV2Router02_Encoder} from "@main/encoder/UniswapV2Router02_Encoder.g.sol";

contract DeployUniswapV2Router02_EncoderScript is DeployScript {
    using DeployerFunctions for Deployer;

    address addressTable;

    function deploy() external returns (UniswapV2Router02_Encoder) {

        addressTable = deployer.getAddress("AddressTable");

        return UniswapV2Router02_Encoder(deployer.deploy_UniswapV2Router02_Encoder("UniswapV2Router02_Encoder", IAddressTable(addressTable) ));
    }
}
