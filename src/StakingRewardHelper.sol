// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {Stake} from "../src/StakingReward.sol";

contract StakingRewardHelper {
    Stake st;
    uint256 lastExecution = block.timestamp;

     function callculateStake(address staker_ , uint16 period_)
     //   address staker_,
       // uint16 period_
    external view returns (uint256 r) {
        uint256 amount_ = st.getStakedAmount(staker_);

        if (period_ == 30) {
            r = ((amount_ * 25) / 100);
        }

        if (period_ == 90) {
            r = ((amount_ * 50) / 100);
        }

        if (period_ == 365) {
            r = amount_;
        }
    }



}
