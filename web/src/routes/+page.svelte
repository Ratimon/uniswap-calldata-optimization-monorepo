<script lang="ts">

  import {parseEther, parseUnits, zeroAddress} from 'viem';

  import {connection, account, pendingActions, network, contracts} from '$lib/web3';

  import TokenField from './TokenField.svelte';

  let tokenLists1 = {
			tokenA: '0xDEADDEADDEADDEADDEADDEADDEADDEADDEADDEAD',
			tokenB: '1',
			tokenC: '2',
		};

  let tokenLists2 = {
			token1: '0xDEADDEADDEADDEADDEADDEADDEADDEADDEADDEAD',
			token2: '2',
		};

  // let data1 = { token: zeroAddress, amountDesired: zeroAddress,  amountMin: parseEther('0')};
  // let data2 = { token: zeroAddress, amountDesired: zeroAddress,  amountMin: parseEther('0')};

  // $: tokenA = data1.token;

  // let submittedData = null;

  let tokenA: string;
  let tokenB: string;
  let amountDesiredA: Number = 1200.5;
  let amountDesiredB: Number = 2500;

  $: result =  {
      tokenA: tokenA,
      tokenB: tokenB,
      amountDesiredA: parseEther(amountDesiredA.toString()),
      amountDesiredB: parseEther(amountDesiredB.toString())
	}


  let to = zeroAddress;
  let deadline = parseUnits('50',0);

  async function encode_addLiquidityData() {

    contracts.execute(async ({contracts, account}) => {
    
      const payload = await contracts.UniswapV2Router02_Encoder.read.encode_addLiquidityData(
      [
        '0xDEADDEADDEADDEADDEADDEADDEADDEADDEADDEAD',
        '0xDEADDEADDEADDEADDEADDEADDEADDEADDEADDEAD',
        parseEther('1200'),
        parseEther('2500'),
        parseEther('1000'),
        parseEther('2000'),
        '0xDEADDEADDEADDEADDEADDEADDEADDEADDEADDEAD',
        parseUnits( '100' , 0)
      ]
      );

      console.log('payload', payload);

		  });

  }

  function addLiquidityCompressed() {

		contracts.execute(async ({contracts, account}) => {

      let payload = await contracts.UniswapV2Router02_Encoder.read.encode_addLiquidityData(
      [
        '0xDEADDEADDEADDEADDEADDEADDEADDEADDEADDEAD',
        '0xDEADDEADDEADDEADDEADDEADDEADDEADDEADDEAD',
        parseEther('1200'),
        parseEther('2500'),
        parseEther('1000'),
        parseEther('2000'),
        '0xDEADDEADDEADDEADDEADDEADDEADDEADDEADDEAD',
        parseUnits( '100' , 0)
      ]
      );

      console.log('payload', payload);

			await contracts.UniswapV2Router02_Optimized.write.addLiquidityCompressed(
        // hardcoded for demo
        [payload],
        // ["0x000001000002000000410d586a20a4c00000000000878678326eac9000000000003635c9adc5dea000000000006c6b935b8bbd4000000000030000000064"],
        // ["0x000001000001000000410d586a20a4c00000000000878678326eac9000000000003635c9adc5dea000000000006c6b935b8bbd4000000000010000000064"],
        {account: account.address}

      );
		});
	}

</script>

<h1 class="text-2xl text-center font-bold underline">
  Demo for call data optimization
</h1>

<section class="px-10 my-10 text-center font-black border-2 border-pink-300">

  <h2 class="text-1xl font-bold">
    Add liquidity
  </h2>

  <div class="px-4 py-10 sm:px-6 lg:px-8 flex flex-col space-y-5 max-w-2xl lg:max-w-7xl">

    <TokenField bind:amountDesired={amountDesiredA} bind:token={tokenA} tokenLists={tokenLists1}  />
    <TokenField bind:amountDesired={amountDesiredB} bind:token={tokenB} tokenLists={tokenLists2}  />

    <div class="bg-slate-400">
      <button tabindex="0" class="btn btn-primary text-error-content" on:click={() => addLiquidityCompressed()}
        >Supply
      </button>
    </div>

  </div>

  <div>
    {result.tokenA}
    {result.tokenB}
    {result.amountDesiredA}
    {result.amountDesiredB}
  </div>

</section>