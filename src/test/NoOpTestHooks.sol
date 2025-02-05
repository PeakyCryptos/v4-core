// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {BaseTestHooks} from "./BaseTestHooks.sol";
import {Hooks} from "../libraries/Hooks.sol";
import {IPoolManager} from "../interfaces/IPoolManager.sol";
import {PoolKey} from "../types/PoolKey.sol";
import {BalanceDelta} from "../types/BalanceDelta.sol";

contract NoOpTestHooks is BaseTestHooks {
    constructor() {
        Hooks.validateHookAddress(
            this,
            Hooks.Calls({
                beforeInitialize: false,
                afterInitialize: false,
                beforeModifyPosition: true,
                afterModifyPosition: false,
                beforeSwap: true,
                afterSwap: false,
                beforeDonate: true,
                afterDonate: false,
                noOp: true
            })
        );
    }

    function beforeModifyPosition(address, PoolKey calldata, IPoolManager.ModifyPositionParams calldata, bytes calldata)
        external
        pure
        override
        returns (bytes4)
    {
        return Hooks.NO_OP_SELECTOR;
    }

    function beforeSwap(address, PoolKey calldata, IPoolManager.SwapParams calldata, bytes calldata)
        external
        pure
        override
        returns (bytes4)
    {
        return Hooks.NO_OP_SELECTOR;
    }

    function beforeDonate(address, PoolKey calldata, uint256, uint256, bytes calldata)
        external
        pure
        override
        returns (bytes4)
    {
        return Hooks.NO_OP_SELECTOR;
    }
}
