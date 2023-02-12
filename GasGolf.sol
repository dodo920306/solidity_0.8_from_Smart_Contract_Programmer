//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GasGolf {
    uint256 public total;

    // function sumIfEvenAndLessThan99(uint256[] memory nums) external {

    //     for (uint256 i = 0; i < nums.length; i += 1) {
    //         bool isEven = num % 2 == 0;
    //         bool isLessThan99 =  num < 99;
    //         if (isEven && isLessThan99) {
    //             total += nums[i];
    //         }
    //     }
    // }

    function sumIfEvenAndLessThan99(uint256[] calldata nums) external {
        uint256 _total = total;
        uint256 len = nums.length;

        for (uint256 i = 0; i < len; ++i) {
            uint256 num = nums[i];
            if (num % 2 == 0 && num < 99) {
                _total += nums[i];
            }
        }
        total = _total;
    }
}
