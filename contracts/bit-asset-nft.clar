;; Title: BitAsset NFT - Collateralized Digital Assets on Stacks
;; 
;; Summary: A comprehensive smart contract for creating, trading, and staking 
;; collateralized NFTs with fractional ownership capabilities on the Stacks blockchain.
;;
;; Description: BitAsset NFT enables users to mint NFTs backed by STX collateral,
;; ensuring intrinsic value to each token. The contract provides a complete asset
;; lifecycle management system including marketplace functionality, fractional
;; ownership division, and staking rewards - all while maintaining Bitcoin-level
;; security through the Stacks Layer 2 protocol.


;; Constants & Error Codes

(define-constant contract-owner tx-sender)

;; Access Control
(define-constant err-owner-only (err u100))
(define-constant err-not-token-owner (err u101))

;; Financial
(define-constant err-insufficient-balance (err u102))
(define-constant err-insufficient-collateral (err u106))

;; NFT Operations
(define-constant err-invalid-token (err u103))
(define-constant err-listing-not-found (err u104))
(define-constant err-invalid-price (err u105))

;; Staking
(define-constant err-already-staked (err u107))
(define-constant err-not-staked (err u108))

;; Validation
(define-constant err-invalid-percentage (err u109))
(define-constant err-invalid-uri (err u110))
(define-constant err-invalid-recipient (err u111))
(define-constant err-overflow (err u112))

;; Protocol Configuration

(define-data-var min-collateral-ratio uint u150)  ;; 150% minimum collateral ratio
(define-data-var protocol-fee uint u25)           ;; 2.5% fee in basis points
(define-data-var total-staked uint u0)
(define-data-var yield-rate uint u50)             ;; 5% annual yield rate in basis points
(define-data-var total-supply uint u0)

;; Data Maps

;; Core NFT Data
(define-map tokens
    { token-id: uint }
    {
        owner: principal,
        uri: (string-ascii 256),
        collateral: uint,
        is-staked: bool,
        stake-timestamp: uint,
        fractional-shares: uint
    }
)

;; Marketplace Listings
(define-map token-listings
    { token-id: uint }
    {
        price: uint,
        seller: principal,
        active: bool
    }
)