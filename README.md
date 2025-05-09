# BitAsset NFT

## Collateralized NFTs with Fractional Ownership & Staking on the Stacks Blockchain

## Overview

**BitAsset NFT** is a feature-rich smart contract built on the **Stacks blockchain**, enabling the creation, trading, fractionalization, and staking of NFTs backed by **STX collateral**. By embedding intrinsic value into NFTs and enabling on-chain yield mechanisms, BitAsset NFTs deliver utility and financial resilience—secured by Bitcoin via Stacks’ Layer 2 architecture.

## Features

### Mint Collateral-Backed NFTs

* NFTs are minted with a **minimum 150% STX collateral ratio**, providing intrinsic, redeemable value.

### Built-in Marketplace

* List and purchase NFTs with automatic **ownership transfers** and protocol fees.

### Fractional Ownership

* Divide NFTs into **transferable fractional shares**, enabling collaborative ownership and liquidity.

### NFT Staking for Yield

* Stake NFTs to earn **on-chain rewards** at an adjustable **annual yield rate** (default: 5%).

### Bitcoin-Level Security

* Operates on Stacks, anchored to Bitcoin’s blockchain for ultimate decentralization and immutability.

## Contract Details

| Item                     | Value                                                       |
| ------------------------ | ----------------------------------------------------------- |
| **Language**             | Clarity                                                     |
| **Blockchain**           | Stacks (Layer 2 for Bitcoin)                                |
| **Contract Name**        | `bitasset-nft`                                              |
| **Main Features**        | Collateralized minting, trading, fractionalization, staking |
| **Default Protocol Fee** | `2.5%` (25 basis points)                                    |
| **Min Collateral Ratio** | `150%`                                                      |
| **Yield Rate (Annual)**  | `5%` (50 basis points)                                      |
| **Staking Unit**         | STX                                                         |

## Usage

### ✅ Minting an NFT

```clojure
(mint-nft uri collateral)
```

* `uri`: ASCII string (≤ 256 chars)
* `collateral`: STX amount with required overcollateralization

### 🔁 Transferring NFTs

```clojure
(transfer-nft token-id recipient)
```

### 🛍 Listing an NFT for Sale

```clojure
(list-nft token-id price)
```

### 🛒 Purchasing an NFT

```clojure
(purchase-nft token-id)
```

### 🔗 Transferring Fractional Shares

```clojure
(transfer-shares token-id recipient share-amount)
```

### 📥 Staking an NFT

```clojure
(stake-nft token-id)
```

### 📤 Unstaking an NFT

```clojure
(unstake-nft token-id)
```

## Access Control

| Action              | Authorization Required  |
| ------------------- | ----------------------- |
| Mint / List / Stake | NFT Owner (`tx-sender`) |
| Transfer NFT        | NFT Owner only          |
| Transfer Shares     | Fractional Owner only   |

## Storage & State

* `tokens`: NFT data including owner, URI, collateral, staking state
* `token-listings`: Marketplace entries
* `fractional-ownership`: Share records per owner
* `staking-rewards`: Reward tracking per token

---

## Error Codes

| Code   | Meaning               |
| ------ | --------------------- |
| `u100` | Owner-only function   |
| `u101` | Not NFT owner         |
| `u102` | Insufficient balance  |
| `u106` | Not enough collateral |
| `u107` | Already staked        |
| `u108` | Not staked            |
| `u109` | Invalid percentage    |
| `u110` | Invalid URI           |
| `u111` | Invalid recipient     |
| `u112` | Overflow detected     |

---

## Configuration Variables

| Variable               | Description                                   |
| ---------------------- | --------------------------------------------- |
| `min-collateral-ratio` | Collateralization requirement (default: 150%) |
| `protocol-fee`         | Marketplace fee (default: 2.5%)               |
| `yield-rate`           | Annual staking yield (default: 5%)            |
| `total-supply`         | Total NFTs minted                             |
| `total-staked`         | Active staked NFTs count                      |

## License

This project is provided under the **MIT License**. See the `LICENSE` file for details.

## Contributing

Contributions are welcome! Please fork the repo, create a feature branch, and submit a pull request.
