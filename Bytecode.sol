//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Factory {
    event Log(address addr);

    function deploy() external {
        bytes memory bytecode = hex"69602a60005260206000f3600052600a6016f3";
        address addr;
        assembly {
            addr := create(0, add(bytecode, 0x20), 0x13)
        }
        require(addr != address(0), "deploy failed");

        emit Log(addr);
    }
}

interface IContract {
    function getMeaningOfLife() external view returns (uint);
}