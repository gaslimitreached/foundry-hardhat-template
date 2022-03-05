import * as dotenv from 'dotenv';
dotenv.config();
import '@nomiclabs/hardhat-ethers';
import '@nomiclabs/hardhat-etherscan';

import { HardhatUserConfig } from 'hardhat/config';

// default values are there to avoid failures when running tests
const RINKEBY_RPC = process.env.RINKEBY_RPC || '1'.repeat(32);
const PRIVATE_KEY = process.env.PRIVATE_KEY || '1'.repeat(64);

const config: HardhatUserConfig = {
  paths: {
    sources: './src',
    tests: './integration',
  },
  defaultNetwork: 'hardhat',
  networks: {
    hardhat: { chainId: 1337 },
    rinkeby: {
      url: RINKEBY_RPC,
      accounts: [PRIVATE_KEY],
    }
  },
  solidity: {
    version: '0.8.10',
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  etherscan: {
    // API key for Etherscan. https://etherscan.io/
    apiKey: process.env.ETHERSCAN_API_KEY ?? '',
  },
};

export default config;
