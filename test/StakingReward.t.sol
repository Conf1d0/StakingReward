// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/interfaces/IERC20.sol";

import {Test, console2} from "forge-std/Test.sol";
import {Stake} from "../src/StakingReward.sol";
import {MockToken} from "../src/Mock.sol";

contract StakingrewardTest is Test {
    Stake public st;
    MockToken public mock;
    IERC20 TNR;
    IERC20 USDC;
    IERC20 USDT;

    address random2 = makeAddr("random2");
    address stakeContract = address(0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f);

    function setUp() public {
        st = new Stake();

        vm.startPrank(random2);

        TNR = new MockToken("TNR", "TNR");
        USDC = new MockToken("USDC", "USDC");
        USDT = new MockToken("USDT", "USDT");

        TNR.approve(stakeContract, 1000); //0xE962c58ACdf0B69f33390a783ad1231994aA460B
        USDC.approve(stakeContract, 1000); //0xcd0D7ec19055F5C080d20d3Fe1798d7321716f40
        USDT.approve(stakeContract, 1000); //0xebFa8d804f193678D42039C83f5a12cFeaf92945

        vm.stopPrank();
    }

    function test_stake() public {
        vm.startPrank(random2);
        bool b = st.stake(100, 30 ,address(USDC));
        assertEq(b, true);

        vm.stopPrank();
    }

    function test_unstake30() public {
        vm.startPrank(random2);

        uint256 balanceBefore = USDC.balanceOf(address(random2));
        console2.log("RANDOM2 BALANCE BEFORE: ", balanceBefore);
        uint256  stakeAmount_ = 100;
        uint16 duration_ = 30;

        st.stake(stakeAmount_, duration_,address(USDC));

        skip(30 days);

        st.unstake(random2 , address(USDC));

        uint balanceAfter = USDC.balanceOf(address(random2));

        console2.log("RANDOM2 BALANCE AFTER : ", balanceAfter);

        assertEq(balanceBefore + 25, balanceAfter);

        vm.stopPrank();
    }

      function test_unstake90() public {
        vm.startPrank(random2);

        uint256 balanceBefore = USDC.balanceOf(address(random2));
        console2.log("RANDOM2 BALANCE BEFORE: ", balanceBefore);
        uint256  stakeAmount_ = 100;
        uint16 duration_ = 90;

        st.stake(stakeAmount_, duration_,address(USDC));

        skip(99 days);

        st.unstake(random2 , address(USDC));

        uint balanceAfter = USDC.balanceOf(address(random2));

        console2.log("RANDOM2 BALANCE AFTER : ", balanceAfter);

        assertEq(balanceBefore + 50, balanceAfter);

        vm.stopPrank();
    }

     function test_unstake365() public {
        vm.startPrank(random2);

        uint256 balanceBefore = USDC.balanceOf(address(random2));
        console2.log("RANDOM2 BALANCE BEFORE: ", balanceBefore);
        uint256  stakeAmount_ = 100;
        uint16 duration_ = 365;

        st.stake(stakeAmount_, duration_,address(USDC));

        skip(365 days);

        st.unstake(random2 , address(USDC));

        uint balanceAfter = USDC.balanceOf(address(random2));

        console2.log("RANDOM2 BALANCE AFTER : ", balanceAfter);

        assertEq(2 * balanceBefore , balanceAfter);

        vm.stopPrank();
    }
}
