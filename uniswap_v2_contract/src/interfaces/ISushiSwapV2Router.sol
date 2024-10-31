// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ISushiSwapV2Router {
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin, 
        address[] memory path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}
