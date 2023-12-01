// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/level0.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Level0Solution is Script {

    level0 public Level0 = level0(0x4285C5a559D4fB46d227990f6cCdB9fe4BA27A91);

    function run() external {
        
        string memory password = Level0.password();
        console.log("Password: ", password);
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Level0.authenticate(password);
        vm.stopBroadcast();
    }
}