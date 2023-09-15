<h1>📚 Calldata Optimization Demo with Monorepo Architecture 📚</h1>

A full-stack snippet & example to demonstrate how to implement calldata gas optimization with [`Solid Grinder`](https://github.com/Ratimon/solid-grinder)

If you wonder how calldata optimization works, you can check it out at this [`guide`](https://github.com/Ratimon/solid-grinder#how-it-works)

> **Note**💡

> The code is not audited yet. Please use it carefully in production.

- [Installation](#installation)
- [Quickstart](#quickstart)
- [Troubleshooting](#troubleshooting)
- [Acknowledgement](#acknowledgement)


## Installation

Assuming that you have [zellij](https://zellij.dev/) installed:

```bash
pnpm i
```

```sh
cd contracts
pnpm i
```

```sh
cd web
pnpm i
```


## Quickstart

There are two main components, which are **blockchain component** and **web component**

1. Spinning up the **blockchain component**:

```sh
cd contracts
pnpm start
```

> **Note**💡

In the first time, it is needed to install relevant dependencies:

```sh
cd contracts
pnpm prepare
```

If it appears that you need to intall more dependencies, just delete `/contracts/lib`, modify the command and re-run it.

This will open a customized terminal with three sub-terminals, including anvil, testing and interaction.

2. In another terminal, run deployment scripts to the local network:

```sh
pnpm contracts:deploy
```
This will atomically deploy sets of deployment scripts.

3. Export deployment artifacts with formated schema to be used later in front-end part:

```sh
pnpm contracts:export-local
```
This schema includes **address** and **abi**.

4. Running the **front-end component**:

```sh
pnpm web:dev
```

> **Note**💡

5. (Optional) kill **blockchain component** when not needed

```sh
cd contracts
pnpm stop
```


## Troubleshooting

These are some guidlines to do when the **front-end component** can not sync to the **blockchain component**:

1. Delete generated files after deployment in your [`contracts/broadcast/`](https://github.com/Ratimon/uniswap-calldata-optimization-monorepo) to clear the cache, and then re-deploy again.

2. Go to your **Metamask** extention and clear the data. There sometimes are  updates in local nonce, so the checksum in front-end pass doesnot match the right ones.

```sh
Settings -> Advanced -> Clear activity and nonce data
```

3. Rebuild again

```sh
pnpm dev
```

4. Make sure your metamask connect to the same address which has been registered. Otherwise, register it!!

> 💡 Note:

You can directly send Tx to the chain via your CLI:

```sh
cast send <Contract Address> "register(address)" <Sender Address> <Addr as Argument> --private-key <Sender Privatekey>
```

5. Open new **Chrome** tab every time after you have spinned up blockchain compoment and deployed the contract in order to make sure the front-end does not cache the wrong config.


## Acknowledgement

> 💡 Note:

We acknowledge, use, and get inspiration from this amazing template: [jolly-roger](https://github.com/wighawag/jolly-roger).