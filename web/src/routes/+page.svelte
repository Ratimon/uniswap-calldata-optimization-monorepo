<script lang="ts">
  import {formatUnits, hexToNumber, hexToBigInt, parseEther, parseUnits, zeroAddress} from 'viem';
  import { balanceETH, balanceMockERC20_A, balanceMockERC20_B, connection, account, pendingActions, network, contracts} from '$lib/web3';
  import TokenField from './TokenField.svelte';

  let tokenLists1: { [key: string]: `0x${string}`; } = {
			tokenA: '0xDEADDEADDEADDEADDEADDEADDEADDEADDEADDEAD',
			tokenB: '0xDEADDEADDEADDEADDEADDEADDEADDEADDEAD0000',
			tokenC: '0xDEADDEADDEADDEADDEADDEADDEADDEADDEAD1111',
		};
  let tokenLists2: { [key: string]: `0x${string}`; } = {
			token1: '0xDEADDEADDEADDEADDEADDEADDEADDEADDEADDEAD',
			token2: '0xDEADDEADDEADDEADDEADDEADDEADDEADDEAD2222',
		};
  
  let thresholds: { [key: string]: Number; } = {
    "95 %": 0.95,
    "90 %": 0.90,
    "80 %": 0.80,
  }

  let tokenA: `0x${string}`;
  let tokenB: `0x${string}`;
  let amountDesiredA: number = 1200.5;
  let amountDesiredB: number = 2500;
  let threshold: number  = 0.95;

  $: currentBalanceETH = $balanceETH.balance;
  $: currentBalanceETHInString = formatUnits(
		currentBalanceETH,
		Number(18),
	);

  $: currentBalanceMockERC20_A = Number(formatUnits(
		$balanceMockERC20_A.balance,
		Number(18),
	));

  $: currentBalanceMockERC20_B =Number(formatUnits(
		$balanceMockERC20_B.balance,
		Number(18),
	));

  $: modelResult =  {
      tokenA: tokenA,
      tokenB: tokenB,
      amountDesiredA: parseEther(amountDesiredA.toString()),
      amountDesiredB: parseEther(amountDesiredB.toString()),
      amountAMin: parseEther( ( amountDesiredA * threshold ).toString()),
      amountABin: parseEther( (amountDesiredB * threshold ).toString()),
      deadline: hexToBigInt('0x32') // current timestamp + 50
	}

  function addLiquidityCompressed() {

		contracts.execute(async ({contracts, account}) => {

      let blockByNumber =  await $connection.provider.request({
        method: 'eth_getBlockByNumber',
        params: ['latest', true],
      })

      let payload = await contracts.UniswapV2Router02_Encoder.read.encode_addLiquidityData(
      [
        modelResult.tokenA,
        modelResult.tokenB,
        modelResult.amountDesiredA,
        modelResult.amountDesiredB,
        parseEther('1000'),
        parseEther('2000'),
        account.address,
        hexToBigInt(blockByNumber.timestamp) + modelResult.deadline
      ]
      );

      console.log('payload', payload);

			await contracts.UniswapV2Router02_Optimized.write.addLiquidityCompressed(
        [payload],
        {account: account.address}

      );
		});
	}

</script>

<h1 class="text-3xl text-center font-bold underline">
  Demo for call data optimization
</h1>

<section class="px-10 my-10 text-center font-black border-2 border-pink-300">

  <h2 class="text-2xl font-bold">
    Add liquidity
  </h2>

  <div class="px-4 py-10 sm:px-6 lg:px-8 flex flex-col space-y-5 max-w-2xl lg:max-w-7xl">

    <TokenField bind:token={tokenA} bind:amountDesired={amountDesiredA} amountMax={currentBalanceMockERC20_A} tokenLists={tokenLists1}  />
    <TokenField bind:token={tokenB} bind:amountDesired={amountDesiredB} amountMax={currentBalanceMockERC20_B} tokenLists={tokenLists2}  />

    <div class="flex justify-center items-center bg-slate-400">
      <div class="rounded-md">
        Select Threshold
      </div>
      <select bind:value={threshold} class="rounded-md text-slate-700">
        {#each Object.entries(thresholds) as [key, value] (key)}
          <option value={value} >
            {key}
          </option>
        {/each}
      </select> 
      <button tabindex="0" class="btn btn-primary text-error-content" on:click={() => addLiquidityCompressed()}
        >Supply
      </button>
    </div>

  </div>

</section>