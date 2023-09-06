<script>

  import MdFormatListBulleted from 'svelte-icons/md/MdFormatListBulleted.svelte'
  import MdKeyboardArrowDown from 'svelte-icons/md/MdKeyboardArrowDown.svelte'

  let isDropdownOpen = false // default state

  const handleDropdownClick = () => {
    isDropdownOpen = !isDropdownOpen 
  }

  const handleDropdownFocusLoss = ({ relatedTarget, currentTarget }) => {
    if (relatedTarget instanceof HTMLElement && currentTarget.contains(relatedTarget)) return 
    isDropdownOpen = false
  }

  const menuItems = ["TokenA", "TokenB", "TokenC"]

</script>

<h1 class="text-2xl text-center font-bold underline">
  Demo for call data optimization
</h1>

<section class="px-10 my-10 text-center font-black  border-2 border-pink-300">

  <h2 class="text-1xl font-bold">
    Add liquidity
  </h2>

  <div class="flex flex-col max-w-2xl mx-auto py-2 px-4 sm:px-6 lg:max-w-7xl lg:px-8">
    <div class="flex flex-row justify-between h-8 bg-slate-400">
      <div class="mx-2">
        Amount to be added
      </div>
      <div class="mx-2">
        Balance
      </div>
    </div>

    <div class="flex flex-row justify-between h-12 px-4 bg-slate-400">
      <form method="POST">
        <label>
          <input
            name="description"
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
        <div class="dropdown" on:focusout={handleDropdownFocusLoss}>
          <button class="btn top-2 bg-slate-400 px-1 py-1 rounded-md border-0 border-pink-300" on:click={handleDropdownClick} >
            {#if isDropdownOpen}
              <MdKeyboardArrowDown />
            {:else}
              <MdFormatListBulleted/>
            {/if}
          </button>
          <ul class="dropdown-content menu bg-slate-400 w-44" style:visibility={isDropdownOpen ? 'visible' : 'hidden'}>
            {#each menuItems as item}
              <li><button class="btn text-slate-300 bg-slate-400">{item}</button></li>
            {/each}
          </ul>
        </div>
      </div>
    </div>

    <div class="basis-1/2 border-2 border-pink-300">
      Test 4
    </div>
    
  <div>
</section>
  
<style lang="postcss">
  :global(html) {
    background-color: theme(colors.gray.100);
  }
</style>