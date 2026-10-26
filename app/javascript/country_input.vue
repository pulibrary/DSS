<template>
    <LuxDropdownMenu buttonLabel="Batch add" :menuItems="menuItems"></LuxDropdownMenu>
    <LuxInputMultiselect></LuxInputMultiselect>
</template>
<script setup>
  import { LuxDropdownMenu, LuxInputMultiselect } from 'lux-design-system';
  const menuItems = [
    "All countries",
    "All Asia",
    "All Europe",
    "All Oceania"
  ]
</script>
