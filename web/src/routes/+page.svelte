<script>

import {connection, account, pendingActions, network, contracts} from '$lib/web3';

  import MdFormatListBulleted from 'svelte-icons/md/MdFormatListBulleted.svelte'
  import MdKeyboardArrowDown from 'svelte-icons/md/MdKeyboardArrowDown.svelte'
  import TokenField from './TokenField.svelte';

  let isDropdownOpen1 = false;
  let isDropdownOpen2 = false;

  let menuItems1 = ["TokenA", "TokenB", "TokenC"];
  let menuItems2 = ["Token1", "Token2"];

  function addLiquidityCompressed() {;

		contracts.execute(async ({contracts, account}) => {
      
      console.log('contracts.UniswapV2Router02_Optimized', contracts.UniswapV2Router02_Optimized.write);

			await contracts.UniswapV2Router02_Optimized.write.addLiquidityCompressed(
        // hardcoded for demo
        
        ["0x000001000002000000410d586a20a4c00000000000878678326eac9000000000003635c9adc5dea000000000006c6b935b8bbd4000000000030000000064"],
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

    <TokenField bind:isDropdownOpen={isDropdownOpen1} bind:menuItems={menuItems1}  />
    <TokenField bind:isDropdownOpen={isDropdownOpen2} bind:menuItems={menuItems2}  />

    <div class="bg-slate-400">
      <button tabindex="0" class="btn btn-primary text-error-content" on:click={() => addLiquidityCompressed()}
        >Supply
      </button>

    </div>
    
  </div>

</section>
  
<style lang="postcss">
  :global(html) {
    background-color: theme(colors.gray.100);
  }
</style>