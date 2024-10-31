> [!IMPORTANT]
> The `cast index-erc7201` feature has been integrated into [Foundry](https://github.com/foundry-rs/foundry). Please make use of this feature.

# ERC-7201 Storage Location Calculator

This utility repository provides tools for calculating storage locations according to the [ERC-7201](https://ercs.ethereum.org/ERCS/erc-7201) standard for Ethereum smart contracts.

This ERC is proposed to enable developers to efficiently manage storage conflict risks during upgrades and other changes by calculating storage slots themselves, rather than relying on the compiler to determine them.

The utility facilitates easy and accurate storage location calculations, streamlining the development process for Ethereum blockchain applications.

## How to use:

1. Open your terminal.

2. Navigate to the directory where the `calc-storage-location.sh` script is located.

3. Run the script by entering the following command, replacing <name> with the seed name for your storage location:
    ```bash
    sh calc-storage-location.sh <name>
    ```

    For example, if your seed name is "example.main", you would enter:
    ```bash
    sh calc-storage-location.sh example.main
    ```

The script will calculate and output the corresponding storage location, which you can then use in your smart contract development to explicitly define storage slots, helping to manage storage conflict risks efficiently.
