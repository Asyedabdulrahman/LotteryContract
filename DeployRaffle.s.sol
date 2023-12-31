pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {Raffle} from "../src/Raffle.sol";

contract DeployRaffle is Script {
    function run() external returns(Raffle,helperconfig) {
        HelperConfig helperConfig = new HelperConfig(); 
        (
            uint64 subscriptionId,
            bytes32 gasLane,
            uint256 automationUpdateInterval,
            uint256 raffleEntranceFee,
            uint32 callbackGasLimit,
            address vrfCoordinatorV2,
            address link,
            uint256 deployerKey
        ) = helperConfig.activeNetworkConfig();
        
        // uint64 subscriptionId;
        // bytes32 gasLane;
        // uint256 automationUpdateInterval;
        // uint256 raffleEntranceFee;
        // uint32 callbackGasLimit;
        // address vrfCoordinatorV2;
}
        
        
        vm.startBroadcast();
        Raffle raffle = new Raffle(
            subscriptionId,
            gasLane,
            automationUpdateInterval,
            raffleEntranceFee,
            callbackGasLimit,
            vrfCoordinatorV2
        );
        vm.stopBroadcast();
        
        return(raffle,helperconfig);
        }
        