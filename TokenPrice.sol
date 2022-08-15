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
            0xa24de01df22b63d23Ebc1882a5E3d4ec0d907bFB
        );
        priceFeedUSDC = AggregatorV3Interface(
            0xa24de01df22b63d23Ebc1882a5E3d4ec0d907bFB
        );
        priceFeedETH = AggregatorV3Interface(
            0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        );
        priceFeedMATIC = AggregatorV3Interface(
            0x7794ee502922e2b723432DDD852B3C30A911F021
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
