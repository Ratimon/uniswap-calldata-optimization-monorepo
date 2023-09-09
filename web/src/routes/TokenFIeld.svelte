<script lang="ts">
 
  export let tokenLists: { [key: string]: `0x${string}`; };
  export let amountDesired: Number;
  export let token: string = "Select Token";

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