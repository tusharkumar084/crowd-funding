# Fixed Crowdfunding Smart Contract

## Overview
This project is a **fixed-parameter crowdfunding smart contract** built with Solidity and deployed on the **Edu Chain**. The contract enables users to contribute ETH towards a predefined funding goal within a set duration. If the goal is met, the owner can withdraw the funds; otherwise, contributors can claim refunds.

### 📌 **Deployed Address:**
```
0xCa06059d13Cea5323bcAae2eBc6b4f40bCa1A119
```

---
## 🔥 Features of Crowdfunding
1. **Fixed Goal** - The contract has a predefined funding target (10 ETH).
2. **Fixed Duration** - Contributions are accepted for 7 days from deployment.
3. **Contributions** - Users can send ETH to participate.
4. **Automatic Refunds** - If the goal is not met by the deadline, contributors can withdraw their ETH.
5. **Secure Owner Withdrawal** - The contract owner can withdraw funds only if the funding goal is met.

---
## 📜 Smart Contract Workflow
1. **Users Contribute** - Anyone can send ETH to the contract address.
2. **Goal Reached?**
   - ✅ **Yes** → Owner withdraws funds after the deadline.
   - ❌ **No** → Contributors can claim refunds.
3. **Secure Transactions** - Funds are stored safely in the contract until withdrawal or refund conditions are met.

---
## 🔗 Deployment & Interaction
### **Deployed On:** Edu Chain
### **Contract Address:** `0xCa06059d13Cea5323bcAae2eBc6b4f40bCa1A119`
### **How to Interact:**
- Send ETH to the contract to contribute.
- Call `withdrawFunds()` after the deadline (if goal is met).
- Call `claimRefund()` after the deadline (if goal is NOT met).

---
## 🛠 Tech Stack
- **Solidity** - Smart contract language
- **Edu Chain** - Blockchain network
- **Ethereum Virtual Machine (EVM)** - Contract execution

---
## 📢 License
This project is released under the **MIT License**.

---
## 🚀 Contribution & Support
If you find this project useful, feel free to fork it, submit PRs, or raise issues!

---

### 🌟 Star this repo if you like the project! 🌟

