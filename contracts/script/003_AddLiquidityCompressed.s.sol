// SPDX-License-Identifier: MIT
pragma solidity =0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {Deployer, getDeployer} from "forge-deploy/Deployer.sol";

import {UniswapV2Router02_Optimized} from "@main/UniswapV2Router02_Optimized.sol";
import {UniswapV2Router02_Encoder} from "@main/encoder/UniswapV2Router02_Encoder.g.sol";

contract AddLiquidityCompressedScript is Script {

    Deployer deployer;

    function setUp() public {
        deployer = getDeployer();
    }

    function run() public {


        address tokenA = 0xdeaDDeADDEaDdeaDdEAddEADDEAdDeadDEADDEaD;
        address tokenB = 0xdeaDDeADDEaDdeaDdEAddEADDEAdDeadDEADDEaD;
        uint256 amountADesired = 0;
        uint256 amountBDesired = 0;
        uint256 amountAMin = 0;
        uint256 amountBMin = 0;
        address to  = 0xdeaDDeADDEaDdeaDdEAddEADDEAdDeadDEADDEaD;
        uint256 deadline = block.timestamp + 1000;

        UniswapV2Router02_Encoder encoder = UniswapV2Router02_Encoder(deployer.getAddress("UniswapV2Router02_Encoder"));

        bytes memory compressedPayload = encoder.encode_addLiquidityData(
            tokenA,
            tokenB,
            amountADesired,
            amountBDesired,
            amountAMin,
            amountBMin,
            to,
            deadline
        );

        UniswapV2Router02_Optimized router = UniswapV2Router02_Optimized(deployer.getAddress("UniswapV2Router02_Optimized"));

        console.log(string.concat("Adding Liqudity: "));
        
        vm.broadcast();

        router.addLiquidityCompressed(compressedPayload);

        console.log(string.concat("Liqudity Added: "));
    }
}