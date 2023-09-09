// SPDX-License-Identifier: MIT
pragma solidity =0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {Deployer, getDeployer} from "forge-deploy/Deployer.sol";

import {AddressTable} from "@main/AddressTable.sol";

contract RegisterAddress2Script is Script {

    Deployer deployer;

    function setUp() public {
        deployer = getDeployer();
    }

    function run() public {

        string memory mnemonic = vm.envString("MNEMONIC");
        uint256 ownerPrivateKey = vm.deriveKey(mnemonic, "m/44'/60'/0'/0/", 1); //  address = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8
        address owner = vm.envOr("DEPLOYER", vm.addr(ownerPrivateKey));

        AddressTable table = AddressTable(deployer.getAddress("AddressTable"));

        console.log(string.concat("is owner registered: "));
        console.logBool(table.isAddressExisted(owner));
        
        vm.broadcast();

        table.register(owner);
        console.log(string.concat("is owner registered: "));
        console.logBool(table.isAddressExisted(owner));
    }
}