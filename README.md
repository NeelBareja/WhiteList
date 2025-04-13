# 🧑‍💻 CryptoDevs NFT Collection – Whitelist-Integrated Minting on Sepolia

Welcome to **CryptoDevs**, an NFT minting smart contract project that allows users to mint NFTs with **whitelist integration**. Built with [Foundry](https://book.getfoundry.sh/) and deployed on the **Sepolia Ethereum Testnet**, this is a great hands-on exercise in smart contract development and deployment.

This project is part of a learning path inspired by [**LearnWeb3.io**](https://learnweb3.io) – a free, fun, and detailed resource for learning Web3!

---

## 🛠 Prerequisites

Before getting started, make sure you have the following:

- ✅ **Foundry** installed  
- ✅ A **wallet (e.g., MetaMask)** with **Sepolia ETH** (you can use a [faucet](https://sepoliafaucet.com))  
- ✅ A **.env** file with your private key and Sepolia RPC endpoint (Infura/Alchemy)  
- ✅ The deployed **Whitelist contract address** (this is passed to `CryptoDevs`)

---

## 📁 Project Structure

```
CryptoDevs/
├── src/
│   ├── CryptoDevs.sol         # Main NFT contract
│   └── Whitelist.sol          # Whitelist contract
├── script/
│   └── Deploy.s.sol           # Deployment script (optional)
├── test/                      # Optional test files
├── .env                       # Environment variables (not committed)
└── README.md                  # You're reading it!
```

---

## ⚙️ Installation & Setup

### 1. Install Foundry (if not done yet)

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### 2. Clone the Repo & Install Dependencies

```bash
git clone https://github.com/your-username/CryptoDevs.git
cd CryptoDevs
```

### 3. Set Up Your Environment

Rename `example.env` to `.env` and add the following:

```env
PRIVATE_KEY=your_wallet_private_key
RPC_URL=https://sepolia.infura.io/v3/your_project_id
ETHERSCAN_API_KEY: get it from eherscan.io
```

> ⚠️ Your wallet must have Sepolia ETH. Use a [Sepolia faucet](https://sepoliafaucet.com) to get test ETH.

---

## 🔨 Compile the Contracts

```bash
forge build
```

This will compile both `Whitelist.sol` and `CryptoDevs.sol`.

---

## 🚀 Deploy to Sepolia

First, deploy your **Whitelist** contract:

```bash
forge create Whitelist.sol:Whitelist --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast --verify
```

Then, take the deployed whitelist contract address and use it to deploy `CryptoDevs`:

```bash
forge create CryptoDevs.sol:CryptoDevs --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast --sig "constructor(address)" <0xYourWhitelistAddress> --verify
```

---

## 🔍 Verify and Explore on Etherscan

1. Go to [Sepolia Etherscan](https://sepolia.etherscan.io/)
2. Paste your deployed contract address
3. View contract ➔ Select "Contract" tab ➔ Verify & Publish your source code
4. Use the ABI to interact via **Read / Write** buttons with your wallet

---

## 💡 What This Contract Does

### 🔗 Whitelist Integration

- Checks if the sender is on a whitelist (`peopleStatus`) from the imported contract

### 💰 Dual Mint Logic

- **Whitelisted users** mint for **free** (only once)  
- **Public users** must pay `0.01 ETH` per mint

### ⛔ Supply Cap

- Max total supply: `20 NFTs`  
- Whitelisted addresses have reserved spots

### 💼 Withdraw Function

- Contract owner can withdraw all ETH collected

---

## ✍️ Interacting with the Contract

You can interact via:

- **Foundry script**
- **Etherscan’s Web UI** under “Write” and “Read” Contract tabs
- **Remix IDE (optional)**

---

## 🔪 Optional: Write Test Cases

Foundry makes testing simple with Forge. You can add tests in the `test/` directory.

Example:

```solidity
function testMintByWhitelisted() public {
    // Simulate whitelist and test minting logic
}
```

---

## 🗓 License

MIT License – free to fork, remix, and build upon.

---

## 🙌 Acknowledgements

- [OpenZeppelin](https://openzeppelin.com/) – battle-tested ERC721 contracts  
- [LearnWeb3.io](https://learnweb3.io) – fun, free Web3 learning path  
- [Foundry](https://book.getfoundry.sh/) – blazing fast Solidity toolkit  
- [Sepolia Etherscan](https://sepolia.etherscan.io) – blockchain explorer

---

