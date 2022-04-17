# Combination Pizza Hut & Taco Bell

Foundry && HardHat starter template.

## Motivation

I like them both. With this set-up we get:

- Unit tests written in solidity
- Foundry's cast
- Integration testing with Hardhat
- Hardhat test coverage
- Hardhat deploy & verify
- Typescript

### Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum
application development written in Rust.**

Foundry consists of:

- [**Forge**](./forge): Ethereum testing framework (like Truffle, Hardhat and
  Dapptools).
- [**Cast**](./cast): Swiss army knife for interacting with EVM smart contracts,
  sending transactions and getting chain data.

**Need help getting started with Foundry? Read the [📖 Foundry
Book][foundry-book] (WIP)!**

[foundry-book]: https://onbjerg.github.io/foundry-book/

### Hardhat

Hardhat is an Ethereum development environment for professionals. It facilitates performing frequent tasks, such as running tests, automatically checking code for mistakes or interacting with a smart contract.

On [Hardhat's website](https://hardhat.org) you will find:

- [Guides to get started](https://hardhat.org/getting-started/)
- [Hardhat Network](https://hardhat.org/hardhat-network/)
- [Plugin list](https://hardhat.org/plugins/)

## Directory Structure

```
integration
|- mover.test.ts - "Hardhat integration tests"
lib
|- forge-std - "Test dependency"
scripts
`- deploy.ts - "hardhat deploy script"
src
|- test
|  |- mocks
|  |  `- MockNFT.sol - "Mock NFT for testing"
|  `- Mover.t.sol - "Unit testi in solidity"
`- Mover.sol - "Solidity contract"
.env.example - "Expamle dot env"
.gitignore - "Ignore workfiles"
.gitmodules -  "Dependecy modules"
.solcover.js - "Configure coverage"
.solhint.json - "Configure solidity lint"
foundry.toml - "Configure foundry"
hardhat.config.ts - "Configure hardhat"
package.json - "Node dependencies"
README.md - "This file"
remappings.txt - "Forge dependcy mappings"
slither.config.json - "Configure slither"
```

## Installation

### Foundry

First run the command below to get `foundryup`, the Foundry toolchain installer:

```sh
curl -L https://foundry.paradigm.xyz | bash
```

If you do not want to use the redirect, feel free to manually download the
foundryup installation script from
[here](https://raw.githubusercontent.com/gakonst/foundry/master/foundryup/install).

Then, in a new terminal session or after reloading your `PATH`, run it to get
the latest `forge` and `cast` binaries:

```sh
foundryup
```

Advanced ways to use `foundryup`, and other documentation, can be found in the
[foundryup package](./foundryup/README.md). Happy forging!

### Hardhat

`npm install` or `yarn`

## NPM Commands

```sh
Scripts available via `npm run-script`:
  compile
    npx hardhat compile
  coverage
    npx hardhat coverage --solcoverjs .solcover.js
  deploy
    npx hardhat run scripts/deploy.ts
  integration
    npx hardhat test
  verify
    npx hardhat verify
```
## Adding dependency

Prefer `npm` packages when available and update the remappings.

### Example

install:
`yarn add -D @openzeppelin/contracts`

remapping:
`@openzeppelin/contracts=node_modules/@openzeppelin/contracts`

import:
`import "@openzeppelin/contracts/token/ERC20/ERC20.sol";`