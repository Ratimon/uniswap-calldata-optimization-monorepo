<script>
  import MdFormatListBulleted from 'svelte-icons/md/MdFormatListBulleted.svelte'
  import MdKeyboardArrowDown from 'svelte-icons/md/MdKeyboardArrowDown.svelte'

  export let isDropdownOpen
  export let menuItems

  export const handleDropdownClick = () => {
    isDropdownOpen = !isDropdownOpen 
  }

  export const handleDropdownFocusLoss = ({ relatedTarget, currentTarget }) => {
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
          <button class="btn top-2 px-1 py-1 bg-slate-400 rounded-md border-0 border-pink-300" on:click={handleDropdownClick} >
            {#if isDropdownOpen}
              <MdKeyboardArrowDown />
            {:else}
              <MdFormatListBulleted/>
            {/if}
          </button>
          <ul class="dropdown-content menu w-44 bg-slate-400" style:visibility={isDropdownOpen ? 'visible' : 'hidden'}>
            {#each menuItems as item}
              <li><button class="btn text-slate-300 bg-slate-400">{item}</button></li>
            {/each}
          </ul>
        </div>
      </div>
    </div>

  </div>