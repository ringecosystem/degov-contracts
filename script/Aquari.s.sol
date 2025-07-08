// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {safeconsole} from "forge-std/safeconsole.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {GovernanceAquari} from "../src/aquari/GovernanceAquari.sol";
import {AquariGovernor} from "../src/aquari/AquariGovernor.sol";
import {Timelock} from "../src/aquari/Timelock.sol";

contract AquariDeploy {
    uint256 MIN_DELAY = 2 days;
    address deployer = 0x0f14341A7f464320319025540E8Fe48Ad0fe5aec;
    address AQUARI = 0x7F0E9971D3320521Fc88F863E173a4cddBB051bA;

    address gAQUARI = 0x23c2e12caaE858f1cc7a4B3d1499C6881C86839b;
    address TL = 0x445A92e8dB20095a1755f4BE32E21E529E942E62;
    address GOV = 0x062f87ae9eCAd31398C0cF5Ef269feb9050b9DF6;

    function _run() public {
        GovernanceAquari gtk = new GovernanceAquari(IERC20(AQUARI));
        safeconsole.log("gtk: ", address(gtk));
        address[] memory roles = new address[](1);
        roles[0] = GOV;
        Timelock tl = new Timelock(MIN_DELAY, roles, roles, GOV);
        safeconsole.log("tl: ", address(tl));
        AquariGovernor gov = new AquariGovernor(gtk, tl);
        safeconsole.log("gov: ", address(gov));

        require(gAQUARI == address(gtk));
        require(TL == address(tl));
        require(GOV == address(gov));
    }
}
