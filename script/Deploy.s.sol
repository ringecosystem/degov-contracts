// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {safeconsole} from "forge-std/safeconsole.sol";
import {AquariDeploy} from "./Aquari.s.sol";

contract Deploy is AquariDeploy, Script {
    function run() public {
        safeconsole.log("Chain Id: ", block.chainid);
        vm.startBroadcast();
        _run();
        vm.stopBroadcast();
    }
}
