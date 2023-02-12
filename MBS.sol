//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MostSignificantBit {
    uint public constant MAX_UINT = type(uint).max;

    function mostSignificantBit(uint x) external pure returns (uint8 msb) {
        // if (x >= 2 ** 128) {
        //     x >>= 128;
        //     r += 128;
        // }
        assembly {
            let f := shl(7, gt(x, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))
            x := shr(f, x)
            msb := or(msb, f)
        }
        // if (x >= 2 ** 64) {
        //     x >>= 64;
        //     r += 64;
        // }
        assembly {
            let f := shl(6, gt(x, 0xFFFFFFFFFFFFFFFF))
            x := shr(f, x)
            msb := or(msb, f)
        }
        // if (x >= 2 ** 32) {
        //     x >>= 32;
        //     r += 32;
        // }
        assembly {
            let f := shl(5, gt(x, 0xFFFFFFFF))
            x := shr(f, x)
            msb := or(msb, f)
        }
        // if (x >= 2 ** 16) {
        //     x >>= 16;
        //     r += 16;
        // }
        assembly {
            let f := shl(4, gt(x, 0xFFFF))
            x := shr(f, x)
            msb := or(msb, f)
        }
        // if (x >= 2 ** 8) {
        //     x >>= 8;
        //     r += 8;
        // }
        assembly {
            let f := shl(3, gt(x, 0xFF))
            x := shr(f, x)
            msb := or(msb, f)
        }
        // if (x >= 2 ** 4) {
        //     x >>= 4;
        //     r += 4;
        // }
        assembly {
            let f := shl(2, gt(x, 0xF)) // 4 or 0
            x := shr(f, x) // >>=4 or >>= 0
            msb := or(msb, f)
        }
        // if (x >= 2 ** 2) {
        //     x >>= 2;
        //     r += 2;
        // }
        assembly {
            let f := shl(1, gt(x, 0x3)) // 2 or 0
            x := shr(f, x) // >>=2 or >>= 0
            msb := or(msb, f)
        }
        // if (x >= 2 ** 1) {
        //     r += 1;
        // }
        assembly {
            let f := gt(x, 0x1) // >1 == >=2
            msb := or(msb, f)
        }
    }
}