IR:
/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/


/// @use-src 0:"Wallet.sol"
object "Wallet_119" {
    code {
        /// @src 0:57:1407  "contract Wallet {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_Wallet_119()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("Wallet_119_deployed"), datasize("Wallet_119_deployed"))

        return(_1, datasize("Wallet_119_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 0:57:1407  "contract Wallet {..."
        function constructor_Wallet_119() {

            /// @src 0:57:1407  "contract Wallet {..."

        }
        /// @src 0:57:1407  "contract Wallet {..."

    }
    /// @use-src 0:"Wallet.sol"
    object "Wallet_119_deployed" {
        code {
            /// @src 0:57:1407  "contract Wallet {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x2e1a7d4d
                {
                    // withdraw(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_withdraw_75(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd0e30db0
                {
                    // deposit()

                    abi_decode_tuple_(4, calldatasize())
                    fun_deposit_106()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf8b2cb4f
                {
                    // getBalance(address)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_getBalance_118(param_0)
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

            function abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            /// @ast-id 75
            /// @src 0:740:1057  "function withdraw(uint256 amount) external {..."
            function fun_withdraw_75(var_amount_31) {

                /// @src 0:801:807  "amount"
                let _1 := var_amount_31
                let expr_35 := _1
                /// @src 0:811:819  "balances"
                let _2 := 0x00
                let expr_36 := _2
                /// @src 0:820:830  "msg.sender"
                let expr_38 := caller()
                /// @src 0:811:831  "balances[msg.sender]"
                let _3 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_36,expr_38)
                let _4 := read_from_storage_split_offset_0_t_uint256(_3)
                let expr_39 := _4
                /// @src 0:801:831  "amount <= balances[msg.sender]"
                let expr_40 := iszero(gt(cleanup_t_uint256(expr_35), cleanup_t_uint256(expr_39)))
                /// @src 0:793:856  "require(amount <= balances[msg.sender], \"insufficient balance\")"
                require_helper_t_stringliteral_a6d1ff1db3d0b9b8c60e12ccab5ce7431be9a2cd0518ac362f1c5c1e0b1cefee(expr_40)
                /// @src 0:891:897  "amount"
                let _5 := var_amount_31
                let expr_48 := _5
                /// @src 0:867:875  "balances"
                let _6 := 0x00
                let expr_44 := _6
                /// @src 0:876:886  "msg.sender"
                let expr_46 := caller()
                /// @src 0:867:887  "balances[msg.sender]"
                let _7 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_44,expr_46)
                /// @src 0:867:897  "balances[msg.sender] -= amount"
                let _8 := read_from_storage_split_offset_0_t_uint256(_7)
                let expr_49 := checked_sub_t_uint256(_8, expr_48)

                update_storage_value_offset_0t_uint256_to_t_uint256(_7, expr_49)
                /// @src 0:915:925  "msg.sender"
                let expr_54 := caller()
                /// @src 0:907:926  "payable(msg.sender)"
                let expr_55 := convert_t_address_to_t_address_payable(expr_54)
                /// @src 0:907:935  "payable(msg.sender).transfer"
                let expr_56_address := convert_t_address_payable_to_t_address(expr_55)
                /// @src 0:936:942  "amount"
                let _9 := var_amount_31
                let expr_57 := _9
                /// @src 0:907:943  "payable(msg.sender).transfer(amount)"

                let _10 := 0
                if iszero(expr_57) { _10 := 2300 }
                let _11 := call(_10, expr_56_address, expr_57, 0, 0, 0, 0)

                if iszero(_11) { revert_forward_1() }

                /// @src 0:974:982  "balances"
                let _12 := 0x00
                let expr_62 := _12
                /// @src 0:983:993  "msg.sender"
                let expr_64 := caller()
                /// @src 0:974:994  "balances[msg.sender]"
                let _13 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_62,expr_64)
                let _14 := read_from_storage_split_offset_0_t_uint256(_13)
                let expr_65 := _14
                /// @src 0:954:994  "uint256 remaining = balances[msg.sender]"
                let var_remaining_61 := expr_65
                /// @src 0:1020:1030  "msg.sender"
                let expr_69 := caller()
                /// @src 0:1032:1038  "amount"
                let _15 := var_amount_31
                let expr_70 := _15
                /// @src 0:1040:1049  "remaining"
                let _16 := var_remaining_61
                let expr_71 := _16
                /// @src 0:1009:1050  "Withdrawal(msg.sender, amount, remaining)"
                let _17 := 0xdf273cb619d95419a9cd0ec88123a0538c85064229baa6363788f743fff90deb
                {
                    let _18 := allocate_unbounded()
                    let _19 := abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack(_18 , expr_70, expr_71)
                    log2(_18, sub(_19, _18) , _17, expr_69)
                }
            }
            /// @src 0:57:1407  "contract Wallet {..."

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

            /// @ast-id 106
            /// @src 0:1063:1261  "function deposit() external payable {..."
            function fun_deposit_106() {

                /// @src 0:1117:1126  "msg.value"
                let expr_80 := callvalue()
                /// @src 0:1129:1130  "0"
                let expr_81 := 0x00
                /// @src 0:1117:1130  "msg.value > 0"
                let expr_82 := gt(cleanup_t_uint256(expr_80), convert_t_rational_0_by_1_to_t_uint256(expr_81))
                /// @src 0:1109:1144  "require(msg.value > 0, \"0 deposit\")"
                require_helper_t_stringliteral_1c395677efbc31cee0582c935314d16d35944286907ad78d26092a4144d101de(expr_82)
                /// @src 0:1178:1187  "msg.value"
                let expr_91 := callvalue()
                /// @src 0:1154:1162  "balances"
                let _20 := 0x00
                let expr_86 := _20
                /// @src 0:1163:1173  "msg.sender"
                let expr_88 := caller()
                /// @src 0:1154:1174  "balances[msg.sender]"
                let _21 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_86,expr_88)
                /// @src 0:1154:1187  "balances[msg.sender] += msg.value"
                let _22 := read_from_storage_split_offset_0_t_uint256(_21)
                let expr_92 := checked_add_t_uint256(_22, expr_91)

                update_storage_value_offset_0t_uint256_to_t_uint256(_21, expr_92)
                /// @src 0:1210:1220  "msg.sender"
                let expr_96 := caller()
                /// @src 0:1222:1231  "msg.value"
                let expr_98 := callvalue()
                /// @src 0:1233:1241  "balances"
                let _23 := 0x00
                let expr_99 := _23
                /// @src 0:1242:1252  "msg.sender"
                let expr_101 := caller()
                /// @src 0:1233:1253  "balances[msg.sender]"
                let _24 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_99,expr_101)
                let _25 := read_from_storage_split_offset_0_t_uint256(_24)
                let expr_102 := _25
                /// @src 0:1202:1254  "Deposit(msg.sender, msg.value, balances[msg.sender])"
                let _26 := 0x90890809c654f11d6e72a28fa60149770a0d11ec6c92319d6ceb2bb0a4ea1a15
                {
                    let _27 := allocate_unbounded()
                    let _28 := abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack(_27 , expr_98, expr_102)
                    log2(_27, sub(_28, _27) , _26, expr_96)
                }
            }
            /// @src 0:57:1407  "contract Wallet {..."

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            /// @ast-id 118
            /// @src 0:1267:1405  "function getBalance(address _address)..."
            function fun_getBalance_118(var__address_108) -> var__111 {
                /// @src 0:1350:1357  "uint256"
                let zero_t_uint256_29 := zero_value_for_split_t_uint256()
                var__111 := zero_t_uint256_29

                /// @src 0:1380:1388  "balances"
                let _30 := 0x00
                let expr_113 := _30
                /// @src 0:1389:1397  "_address"
                let _31 := var__address_108
                let expr_114 := _31
                /// @src 0:1380:1398  "balances[_address]"
                let _32 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_113,expr_114)
                let _33 := read_from_storage_split_offset_0_t_uint256(_32)
                let expr_115 := _33
                /// @src 0:1373:1398  "return balances[_address]"
                var__111 := expr_115
                leave

            }
            /// @src 0:57:1407  "contract Wallet {..."

        }

        data ".metadata" hex"a3646970667358221220bea80c9f3e941b649b5312ed63eadc9ed57ad80cbaff0af2dc0b7a9585c743db6c6578706572696d656e74616cf564736f6c634300080b0041"
    }

}


