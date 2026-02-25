# create-8004-agent Wizard Options

Reference for mapping user intent to wizard answers and for automating or guiding the CLI.

## Prompt Order

The wizard asks in this order (inquirer prompts):

1. **projectDir** (input) – Project directory or `.` for current. Default: `my-agent`
2. **agentName** (input) – Agent name. Default: `my agent`
3. **agentDescription** (input) – Description. Default: `test agent created with create-8004-agent`
4. **agentImage** (input) – Image URL. Default: `https://example.com/agent.png`
5. **chain** (list) – Blockchain network. Values below.
6. **agentWallet** (input) – EVM or Solana address; empty to auto-generate.
7. **features** (checkbox) – A2A, MCP, x402. x402 disabled on chains without facilitator support.
8. **a2aStreaming** (confirm, only when A2A selected) – Enable SSE. Default: false
9. **trustModels** (checkbox) – reputation, crypto-economic, tee-attestation. Default: reputation

## Chain Keys (EVM)

| Key             | Name                     | x402 |
|-----------------|--------------------------|------|
| eth-mainnet     | Ethereum Mainnet         | No   |
| base-mainnet    | Base Mainnet             | Yes  |
| polygon-mainnet | Polygon Mainnet          | Yes  |
| monad-mainnet   | Monad Mainnet            | No   |
| eth-sepolia     | Ethereum Sepolia         | No   |
| base-sepolia    | Base Sepolia             | Yes  |
| polygon-amoy    | Polygon Amoy             | Yes  |
| monad-testnet   | Monad Testnet            | No   |

## Chain Keys (Solana)

| Key           | Name          |
|---------------|---------------|
| solana-devnet | Solana Devnet |

## Feature Availability

- **A2A**: All chains.
- **MCP**: All chains.
- **x402**: Only chains with x402 facilitator (Base, Polygon mainnet/testnet). Not Ethereum, not Monad.

## Trust Models

- `reputation`
- `crypto-economic`
- `tee-attestation`

Default selection: `reputation`.
