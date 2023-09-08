<script lang="ts">
  import {zeroAddress, parseEther, parseUnits} from 'viem';

  import MdFormatListBulleted from 'svelte-icons/md/MdFormatListBulleted.svelte'
  import MdKeyboardArrowDown from 'svelte-icons/md/MdKeyboardArrowDown.svelte'

 
  export let tokenLists: { [key: string]: string; };

//   export type SupplyField = {
//     tokenA: string;
// 	   tokenB: string;
// 	   amountADesired: BigInt;
// 	   amountBDesired: BigInt;
//     amountAMin: BigInt;
//     to: string;
//     deadline: Number;
// };


  // export let data: any;
  // export let token: any;
  export let amountDesired: any;

  export let token: any = "select";

	// export let onSubmit = () => {};


  // let token = data.tokenA ?? zeroAddress;
	// let amountDesired = data.amountADesired ?? parseEther('0');
	// let amountMin = data.amountAMin ?? parseEther('0');
  
  // let token = zeroAddress;
	// let amountDesired = parseEther('0');
	// let amountMin =  parseEther('0');

  // let amountDesired: any;

  // $: token = data.tokenA
  // $: data.amountDesired = amountDesired
	// $: amountDesired = data.amountADesired
	// $: amountMin = data.amountAMin


  // $: data = {
	// 	token, amountDesired, amountMin
	// };

  let isDropdownOpen: boolean = false;

  const handleDropdownClick = () => {
    isDropdownOpen = !isDropdownOpen 
  }

  const handleDropdownFocusLoss = ({ relatedTarget, currentTarget } : any) => {
    if (relatedTarget instanceof HTMLElement && currentTarget.contains(relatedTarget)) return 
    isDropdownOpen = false
  }

  
</script>


<div class="flex flex-col">
    <div class="flex flex-row justify-between h-8 bg-slate-400">
      <div class="mx-2">
        Amount to be added
      </div>
      <div class="mx-2">
        Balance
      </div>
    </div>

    <div class="px-4 flex flex-row justify-between h-12 bg-slate-400">
      <form>
        <label>
          <input
            name="Amount to be added"
            bind:value={amountDesired}
            autocomplete="off"
            class="text-slate-700"
          />
        </label>
      </form>

      <button class="bg-slate-400 hover:bg-slate-600 rounded-md border-2 border-pink-300">
        Max
      </button>

      <div class="flex justify-between items-center rounded-md border-2 border-pink-300">
        <!-- <div class="rounded-md">
          Select Token
        </div>
        <div class="dropdown" on:focusout={handleDropdownFocusLoss}>
          <button class="btn top-2 px-1 py-1 bg-slate-400 rounded-md border-0 border-pink-300" on:click={handleDropdownClick} >
            {#if isDropdownOpen}
              <MdKeyboardArrowDown />
            {:else}
              <MdFormatListBulleted/>
            {/if}
          </button>
          <ul class="dropdown-content menu w-44 bg-slate-400" style:visibility={isDropdownOpen ? 'visible' : 'hidden'}>
            {#each tokenLists as item}
              <li><div class="text-slate-300 bg-slate-400">{item}</div></li>
            {/each}
          </ul>
        </div> -->

        <select bind:value={token} class="rounded-md text-slate-700">
          {#each Object.entries(tokenLists) as [key, value] (key)}
            <option value={value} >
              {key}
            </option>
          {/each}
        </select>

        
      </div>
    </div>

  </div>