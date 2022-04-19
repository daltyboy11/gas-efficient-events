IR:
/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/


/// @use-src 0:"Wallet2.sol"
object "Wallet2_86" {
    code {
        /// @src 0:56:1652  "contract Wallet2 {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_Wallet2_86()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("Wallet2_86_deployed"), datasize("Wallet2_86_deployed"))

        return(_1, datasize("Wallet2_86_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 0:56:1652  "contract Wallet2 {..."
        function constructor_Wallet2_86() {

            /// @src 0:56:1652  "contract Wallet2 {..."

        }
        /// @src 0:56:1652  "contract Wallet2 {..."

    }
    /// @use-src 0:"Wallet2.sol"
    object "Wallet2_86_deployed" {
        code {
            /// @src 0:56:1652  "contract Wallet2 {..."
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x2e1a7d4d
                {
                    // withdraw(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_withdraw_45(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd0e30db0
                {
                    // deposit()

                    abi_decode_tuple_(4, calldatasize())
                    fun_deposit_73()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf8b2cb4f
                {
                    // getBalance(address)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_getBalance_85(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }

            revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74()

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
                revert(0, 0)
            }

            function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
                revert(0, 0)
            }

            function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
                revert(0, 0)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function abi_decode_t_address(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address(value)
            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function store_literal_in_memory_a6d1ff1db3d0b9b8c60e12ccab5ce7431be9a2cd0518ac362f1c5c1e0b1cefee(memPtr) {

                mstore(add(memPtr, 0), "insufficient balance")

            }

            function abi_encode_t_stringliteral_a6d1ff1db3d0b9b8c60e12ccab5ce7431be9a2cd0518ac362f1c5c1e0b1cefee_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 20)
                store_literal_in_memory_a6d1ff1db3d0b9b8c60e12ccab5ce7431be9a2cd0518ac362f1c5c1e0b1cefee(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_a6d1ff1db3d0b9b8c60e12ccab5ce7431be9a2cd0518ac362f1c5c1e0b1cefee__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_a6d1ff1db3d0b9b8c60e12ccab5ce7431be9a2cd0518ac362f1c5c1e0b1cefee_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_a6d1ff1db3d0b9b8c60e12ccab5ce7431be9a2cd0518ac362f1c5c1e0b1cefee(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_a6d1ff1db3d0b9b8c60e12ccab5ce7431be9a2cd0518ac362f1c5c1e0b1cefee__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function panic_error_0x11() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error_0x11() }

                diff := sub(x, y)
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_uint256(value)))
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function convert_t_uint160_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_address_payable(value)
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function revert_forward_1() {
                let pos := allocate_unbounded()
                returndatacopy(pos, 0, returndatasize())
                revert(pos, returndatasize())
            }

            /// @ast-id 45
            /// @src 0:131:848  "function withdraw(uint256 amount) external {..."
            function fun_withdraw_45(var_amount_7) {

                /// @src 0:192:198  "amount"
                let _1 := var_amount_7
                let expr_11 := _1
                /// @src 0:202:210  "balances"
                let _2 := 0x00
                let expr_12 := _2
                /// @src 0:211:221  "msg.sender"
                let expr_14 := caller()
                /// @src 0:202:222  "balances[msg.sender]"
                let _3 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_12,expr_14)
                let _4 := read_from_storage_split_offset_0_t_uint256(_3)
                let expr_15 := _4
                /// @src 0:192:222  "amount <= balances[msg.sender]"
                let expr_16 := iszero(gt(cleanup_t_uint256(expr_11), cleanup_t_uint256(expr_15)))
                /// @src 0:184:247  "require(amount <= balances[msg.sender], \"insufficient balance\")"
                require_helper_t_stringliteral_a6d1ff1db3d0b9b8c60e12ccab5ce7431be9a2cd0518ac362f1c5c1e0b1cefee(expr_16)
                /// @src 0:282:288  "amount"
                let _5 := var_amount_7
                let expr_24 := _5
                /// @src 0:258:266  "balances"
                let _6 := 0x00
                let expr_20 := _6
                /// @src 0:267:277  "msg.sender"
                let expr_22 := caller()
                /// @src 0:258:278  "balances[msg.sender]"
                let _7 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_20,expr_22)
                /// @src 0:258:288  "balances[msg.sender] -= amount"
                let _8 := read_from_storage_split_offset_0_t_uint256(_7)
                let expr_25 := checked_sub_t_uint256(_8, expr_24)

                update_storage_value_offset_0t_uint256_to_t_uint256(_7, expr_25)
                /// @src 0:306:316  "msg.sender"
                let expr_30 := caller()
                /// @src 0:298:317  "payable(msg.sender)"
                let expr_31 := convert_t_address_to_t_address_payable(expr_30)
                /// @src 0:298:326  "payable(msg.sender).transfer"
                let expr_32_address := convert_t_address_payable_to_t_address(expr_31)
                /// @src 0:327:333  "amount"
                let _9 := var_amount_7
                let expr_33 := _9
                /// @src 0:298:334  "payable(msg.sender).transfer(amount)"

                let _10 := 0
                if iszero(expr_33) { _10 := 2300 }
                let _11 := call(_10, expr_32_address, expr_33, 0, 0, 0, 0)

                if iszero(_11) { revert_forward_1() }

                /// @src 0:387:395  "balances"
                let _12 := 0x00
                let expr_38 := _12
                /// @src 0:396:406  "msg.sender"
                let expr_40 := caller()
                /// @src 0:387:407  "balances[msg.sender]"
                let _13 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_38,expr_40)
                let _14 := read_from_storage_split_offset_0_t_uint256(_13)
                let expr_41 := _14
                /// @src 0:367:407  "uint256 remaining = balances[msg.sender]"
                let var_remaining_37 := expr_41
                /// @src 0:417:842  "assembly {..."
                {
                    mstore(0, xor(shl(160, 0x2), caller()))
                    mstore(32, var_amount_7)
                    mstore(64, var_remaining_37)
                    log0(0, 96)
                }

            }
            /// @src 0:56:1652  "contract Wallet2 {..."

            function cleanup_t_rational_0_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_0_by_1(value)))
            }

            function store_literal_in_memory_1c395677efbc31cee0582c935314d16d35944286907ad78d26092a4144d101de(memPtr) {

                mstore(add(memPtr, 0), "0 deposit")

            }

            function abi_encode_t_stringliteral_1c395677efbc31cee0582c935314d16d35944286907ad78d26092a4144d101de_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 9)
                store_literal_in_memory_1c395677efbc31cee0582c935314d16d35944286907ad78d26092a4144d101de(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_1c395677efbc31cee0582c935314d16d35944286907ad78d26092a4144d101de__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_1c395677efbc31cee0582c935314d16d35944286907ad78d26092a4144d101de_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_1c395677efbc31cee0582c935314d16d35944286907ad78d26092a4144d101de(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_1c395677efbc31cee0582c935314d16d35944286907ad78d26092a4144d101de__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error_0x11() }

                sum := add(x, y)
            }

            /// @ast-id 73
            /// @src 0:854:1506  "function deposit() external payable {..."
            function fun_deposit_73() {

                /// @src 0:908:917  "msg.value"
                let expr_50 := callvalue()
                /// @src 0:920:921  "0"
                let expr_51 := 0x00
                /// @src 0:908:921  "msg.value > 0"
                let expr_52 := gt(cleanup_t_uint256(expr_50), convert_t_rational_0_by_1_to_t_uint256(expr_51))
                /// @src 0:900:935  "require(msg.value > 0, \"0 deposit\")"
                require_helper_t_stringliteral_1c395677efbc31cee0582c935314d16d35944286907ad78d26092a4144d101de(expr_52)
                /// @src 0:969:978  "msg.value"
                let expr_61 := callvalue()
                /// @src 0:945:953  "balances"
                let _15 := 0x00
                let expr_56 := _15
                /// @src 0:954:964  "msg.sender"
                let expr_58 := caller()
                /// @src 0:945:965  "balances[msg.sender]"
                let _16 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_56,expr_58)
                /// @src 0:945:978  "balances[msg.sender] += msg.value"
                let _17 := read_from_storage_split_offset_0_t_uint256(_16)
                let expr_62 := checked_add_t_uint256(_17, expr_61)

                update_storage_value_offset_0t_uint256_to_t_uint256(_16, expr_62)
                /// @src 0:1030:1038  "balances"
                let _18 := 0x00
                let expr_66 := _18
                /// @src 0:1039:1049  "msg.sender"
                let expr_68 := caller()
                /// @src 0:1030:1050  "balances[msg.sender]"
                let _19 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_66,expr_68)
                let _20 := read_from_storage_split_offset_0_t_uint256(_19)
                let expr_69 := _20
                /// @src 0:1011:1050  "uint256 _balance = balances[msg.sender]"
                let var__balance_65 := expr_69
                /// @src 0:1060:1500  "assembly {..."
                {
                    mstore(0, xor(shl(160, 0x1), caller()))
                    mstore(32, callvalue())
                    mstore(64, var__balance_65)
                    log0(0, 96)
                }

            }
            /// @src 0:56:1652  "contract Wallet2 {..."

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            /// @ast-id 85
            /// @src 0:1512:1650  "function getBalance(address _address)..."
            function fun_getBalance_85(var__address_75) -> var__78 {
                /// @src 0:1595:1602  "uint256"
                let zero_t_uint256_21 := zero_value_for_split_t_uint256()
                var__78 := zero_t_uint256_21

                /// @src 0:1625:1633  "balances"
                let _22 := 0x00
                let expr_80 := _22
                /// @src 0:1634:1642  "_address"
                let _23 := var__address_75
                let expr_81 := _23
                /// @src 0:1625:1643  "balances[_address]"
                let _24 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_80,expr_81)
                let _25 := read_from_storage_split_offset_0_t_uint256(_24)
                let expr_82 := _25
                /// @src 0:1618:1643  "return balances[_address]"
                var__78 := expr_82
                leave

            }
            /// @src 0:56:1652  "contract Wallet2 {..."

        }

        data ".metadata" hex"a36469706673582212202a41793c94da8e0faaa4554b872ea00cd1cd2f25c6effd4ce3ab11c11417e1be6c6578706572696d656e74616cf564736f6c634300080b0041"
    }

}


