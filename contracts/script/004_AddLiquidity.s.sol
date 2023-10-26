// SPDX-License-Identifier: MIT
pragma solidity =0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {Deployer, getDeployer} from "forge-deploy/Deployer.sol";

import {UniswapV2Router02} from "@main/UniswapV2Router02.sol";

contract AddLiquidityScript is Script {

    Deployer deployer;

    function setUp() public {
        deployer = getDeployer();
    }

    function run() public {


        address tokenA = address(0);
        address tokenB = address(0);
        uint256 amountADesired = 0;
        uint256 amountBDesired = 0;
        uint256 amountAMin = 0;
        uint256 amountBMin = 0;
        address to  = address(0);
        uint256 deadline = block.timestamp + 1000;


        UniswapV2Router02 router = UniswapV2Router02(deployer.getAddress("UniswapV2Router02"));

        console.log(string.concat("Adding Liqudity: "));
        
        vm.broadcast();

        router.addLiquidity(tokenA, tokenB, amountADesired, amountBDesired, amountAMin, amountBMin, to, deadline);

        console.log(string.concat("Liqudity Added: "));
    }
}