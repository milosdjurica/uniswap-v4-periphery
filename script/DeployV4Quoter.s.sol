// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console2.sol";
import "forge-std/Script.sol";

import {IPoolManager} from "@uniswap/v4-core/src/interfaces/IPoolManager.sol";
import {V4Quoter} from "../src/lens/V4Quoter.sol";

contract DeployV4Quoter is Script {
    function setUp() public {}

    function run(address poolManager) public returns (V4Quoter state) {
        vm.startBroadcast();

        // forge script --broadcast --sig 'run(address)' --rpc-url <RPC_URL> --private-key <PRIV_KEY> --verify script/DeployV4Quoter.s.sol:DeployV4Quoter <POOL_MANAGER_ADDR>
        state = new V4Quoter(IPoolManager(poolManager));
        console2.log("V4Quoter", address(state));
        console2.log("PoolManager", address(state.poolManager()));

        vm.stopBroadcast();
    }
}
