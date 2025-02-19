// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {console} from "forge-std/console.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        // Before startBroadcast -> not "real" tx
        HelperConfig helperConfig = new HelperConfig();
        (address ethPriceFeed,) = helperConfig.activeNetworkConfig();
        // console.log("ethPriceFeed", ethPriceFeed);
        vm.startBroadcast();
        // After startBroadcast -> real tx
        FundMe fundMe = new FundMe(ethPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
