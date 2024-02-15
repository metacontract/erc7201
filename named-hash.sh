#!/usr/bin/env sh

# keccak256(abi.encode(uint256(keccak256("example.main")) - 1)) & ~bytes32(uint256(0xff));
# 1. hash = keccak256("example.main")
# 2. hash_minus_one = hash - 1 = uint256(keccak256("example.main")) - 1)
# 3. second_hash = keccak256(hash_minus_one) = keccak256(abi.encode(uint256(keccak256("example.main")) - 1))
# 4. named_hash = keccak256(abi.encode(uint256(keccak256("example.main")) - 1)) & ~bytes32(uint256(0xff));
# named-hash("example.main")
#   -> 0x183a6125c38840424c4a85fa12bab2ab606c4b6d0e7cc73c0c06ba5300eab500

## 1. Calculate hash of name
hash=$(cast k $1)
# echo "$hash"

## 2. Minus one
### 2-1. Since direct handling of 256-bit calculations is not possible on the shell, only the last two digits will be extracted for computation.
last_two_of_hash="${hash: -2}"
last_two_of_hash_minus_one=$(printf "%x\n" $((0x$last_two_of_hash - 1)))
# echo "$last_two_of_hash_minus_one"
### 2-2. Concat
rest_of_hash="${hash%??}"
second_hash_seed="${rest_of_hash}${last_two_of_hash_minus_one}"
# echo "$second_hash_seed"

## 3. Calculate 2nd-hash
second_hash=$(cast k $second_hash_seed)
# echo "$second_hash"

## 4. Calculate final named_hash
rest_of_second_hash="${second_hash%??}"
named_hash="${rest_of_second_hash}00"
echo "$named_hash"
