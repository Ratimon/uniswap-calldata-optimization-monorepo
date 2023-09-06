<script>

  import MdFormatListBulleted from 'svelte-icons/md/MdFormatListBulleted.svelte'
  import MdKeyboardArrowDown from 'svelte-icons/md/MdKeyboardArrowDown.svelte'
  import TokenField from './TokenField.svelte';

  let isDropdownOpen1 = false
  let isDropdownOpen2 = false

  let menuItems1 = ["TokenA", "TokenB", "TokenC"]
  let menuItems2 = ["Token1", "Token2"]

</script>

<h1 class="text-2xl text-center font-bold underline">
  Demo for call data optimization
</h1>

<section class="px-10 my-10 text-center font-black  border-2 border-pink-300">

  <h2 class="text-1xl font-bold">
    Add liquidity
  </h2>

  <div class="flex flex-col max-w-2xl mx-auto py-2 px-4 sm:px-6 lg:max-w-7xl lg:px-8">

    <TokenField bind:isDropdownOpen={isDropdownOpen1} bind:menuItems={menuItems1}  />
    <TokenField bind:isDropdownOpen={isDropdownOpen1} bind:menuItems={menuItems2}  />

  <div class="basis-1/2 border-2 border-pink-300">
      Test 2
  </div>
</section>
  
<style lang="postcss">
  :global(html) {
    background-color: theme(colors.gray.100);
  }
</style>