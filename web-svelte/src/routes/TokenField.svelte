<script lang="ts">
 
  export let token: string = "Select Token";
  export let amountDesired: number;
  export let amountMax: number;
  export let tokenLists: { [key: string]: `0x${string}`; };
 
  const selectMaxvalue = () => {
    amountDesired = amountMax;
  }
  
</script>


<div class="flex flex-col ">

    <div class="flex flex-row justify-between h-8 bg-slate-400">
      <div class="mx-2 md:text-2xl">
        Amount to be added
      </div>
      <div class="mx-2">
        Current Balance: {amountMax}
      </div>
    </div>

    <div class="px-4 flex flex-row place-content-evenly h-12 bg-slate-400">
      <form>
        <label>
          <input
            name="Amount to be added"
            bind:value={amountDesired}
            autocomplete="off"
            class="w-full sm:w-96 text-slate-700"
          />
        </label>
      </form>

      <button  on:click={selectMaxvalue} class="bg-slate-400 hover:bg-slate-600 w-24 rounded-md border-2 border-pink-300">
        Max
      </button>

      <div class="flex justify-between items-center rounded-md border-2 border-pink-300">
        <div class="rounded-md">
          Select Token
        </div>
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