// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract TokenPrice {
    AggregatorV3Interface internal priceFeedUSDT;
    AggregatorV3Interface internal priceFeedUSDC;
    AggregatorV3Interface internal priceFeedETH;
    AggregatorV3Interface internal priceFeedMATIC;

    constructor() {
        priceFeedUSDT = AggregatorV3Interface(
            0x92C09849638959196E976289418e5973CC96d645
        );
        priceFeedUSDC = AggregatorV3Interface(
            0x572dDec9087154dC5dfBB1546Bb62713147e0Ab0
        );
        priceFeedETH = AggregatorV3Interface(
            0x0715A7794a1dc8e42615F059dD6e406A6594651A
        );
        priceFeedMATIC = AggregatorV3Interface(
            0xd0D5e3DB44DE05E9F294BB0a3bEEaF030DE24Ada
        );
    }

    function getLatestPrice() public view returns (int,int,int,int) {
        (
            /*uint80 roundID*/,
            int usdtPrice,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeedUSDT.latestRoundData();
        (
            /*uint80 roundID*/,
            int usdcPrice,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeedUSDC.latestRoundData();
        (
            /*uint80 roundID*/,
            int ethPrice,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeedETH.latestRoundData();
        (
            /*uint80 roundID*/,
            int maticPrice,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeedMATIC.latestRoundData();

        return (usdtPrice, usdcPrice, ethPrice, maticPrice);
    }

}
