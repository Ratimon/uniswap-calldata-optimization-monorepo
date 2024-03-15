<h1>📚 Calldata Optimization Demo with Monorepo Architecture 📚</h1>

A full-stack snippet & example to demonstrate how to implement calldata gas optimization with [`Solid Grinder`](https://github.com/Ratimon/solid-grinder)

If you wonder how calldata optimization works, you can check it out at this [`guide`](https://github.com/Ratimon/solid-grinder#how-it-works)

> **Note**💡

> The code is not audited yet. Please use it carefully in production.

- [Installation](#installation)
- [Quickstart](#quickstart)
- [Production](#production)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
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
cd web-svelte
pnpm i
```


## Quickstart

1. Copy `.env` into `.env.<network>.local` and modidy as required. For example, this is a file (`.env.optimism.local`)(https://github.com/Ratimon/uniswap-calldata-optimization-monorepo/.env.optimism.local) for optimism network:

> **Note**💡

More style and convention guide for environment variable management can be found here : [ldenv](https://github.com/wighawag/ldenv)

```sh
# -------------------------------------------------------------------------------------------------
# IMPORTANT!
# -------------------------------------------------------------------------------------------------
# USE .env.local and .env.<context>.local to set secrets
# .env and .env.<context> are used for default public env
# We use vite.js style env setup : https://vitejs.dev/guide/env-and-mode.html#modes
# -------------------------------------------------------------------------------------------------

ETHERSCAN_KEY=
RPC_URL_optimism=

MNEMONIC=
DEPLOYER=
DEPLOYER_PRIVATE_KEY=
DEPLOYMENT_CONTEXT=optimism
ENV_MODE=DEPLOYMENT_CONTEXT
```

There are two main components, which are **blockchain component** and **web component**

2. Spinning up the **blockchain component**:

```sh
cd contracts
pnpm start
```

If it appears that you need to intall more dependencies, just delete `/contracts/lib`, modify the command and re-run it.

> **Note**💡

In the first time, it is needed to install relevant dependencies:

```sh
cd contracts
pnpm prepare
```

This will open a customized terminal with three sub-terminals, including anvil, testing and interaction.

3. In another terminal, run deployment scripts to the local network:

```sh
pnpm contracts:deploy_local_all
```
This will atomically deploy sets of deployment scripts.

4. Export deployment artifacts with formated schema to be used later in front-end part:

```sh
pnpm contracts:export_local
```
This schema includes **address** and **abi**.

5. Running the **front-end component**:

```sh
pnpm web:svelte:dev
```

> **Note**💡

5. (Optional) kill **blockchain component** when not needed

```sh
cd contracts
pnpm stop
```


## Troubleshooting

These are some guidlines to do when the **front-end component** can not sync to the **blockchain component**:

1. Delete generated files after deployment in your [`contracts/broadcast/`](https://github.com/Ratimon/uniswap-calldata-optimization-monorepo/), [`contracts/deployments/`](https://github.com/Ratimon/uniswap-calldata-optimization-monorepo), and [`contracts/cache/`](https://github.com/Ratimon/uniswap-calldata-optimization-monorepo) to clear the cache, and then re-deploy again.

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


## Contributing

See our [`contributing guidelines`](./CONTRIBUTING.md).

We are currently still in an experimental phase leading up to a first audit and would love to hear your feedback on how we can improve `Solid Grinder`.

If you want to say **thank you** or/and support active development of Solid Grinder:

- Add a [GitHub Star](https://github.com/Ratimon/solid-grinder) to the
  project.
- Tweet about Solid Grinder.
- Write interesting articles about the project on
  [Medium](https://medium.com/), or your personal blog.


## Acknowledgement

> 💡 Note:

We acknowledge, use, and get inspiration from this amazing template: [jolly-roger](https://github.com/wighawag/jolly-roger).