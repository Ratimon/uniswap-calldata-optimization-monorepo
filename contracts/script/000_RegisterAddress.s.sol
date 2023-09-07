// SPDX-License-Identifier: MIT
pragma solidity =0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {Deployer, getDeployer} from "forge-deploy/Deployer.sol";

import {AddressTable} from "@main/AddressTable.sol";

contract RegisterAddressScript is Script {
    Deployer deployer;

    function setUp() public {
        deployer = getDeployer();
    }

    function run() public {

        address addr = 0xdeaDDeADDEaDdeaDdEAddEADDEAdDeadDEADDEaD;

        AddressTable table = AddressTable(deployer.getAddress("AddressTable"));

        console.log(string.concat("is address registered: "));
        console.logBool(table.isAddressExisted(addr));
        vm.broadcast();
        table.register(addr);
        console.log(string.concat("is address registered: "));
        console.logBool(table.isAddressExisted(addr));
    }
}