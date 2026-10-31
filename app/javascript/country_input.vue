<template>
  <div v-if="menuItems.length && items.length">
    <LuxDropdownMenu type="buttons" buttonLabel="Batch add" :menuItems="menuItems" @menuItemClicked="handleBatchAddClick($event)"></LuxDropdownMenu>
    <LuxInputMultiselect v-model="selectedCountries" :items="items">
      <template v-slot:hidden-input="{ selectedItems }">
        <input v-for="item in selectedItems" type="hidden" :name="formControlName" :value="item.id"></input>
      </template>
    </LuxInputMultiselect>
  </div>
</template>
<script setup>
  import { ref } from 'vue';
  import { LuxDropdownMenu, LuxInputMultiselect } from 'lux-design-system';

  const props = defineProps(['currentCountries', 'formControlName']);
  const selectedCountries = ref(props.currentCountries || []);
  const menuItems = ref([]);
  const items = ref([]);
  const regionCountryMap = ref({});

  async function fetchJson(url) {
    const response = await fetch(url);
    const data = await response.json();
    return data;
  }

  function handleBatchAddClick(event) {
    const buttonText = event.target.textContent
    const desiredRegion = buttonText.match(/All (.*)/)[1]
    if ( regionCountryMap.value[desiredRegion] ) {
      batchAdd(regionCountryMap.value[desiredRegion])
    } else if (buttonText == 'All countries') {
      // Add all countries to the model
      selectedCountries.value = items.value
    }
  }

  function batchAdd(countries) {
    const selections = new Set(selectedCountries.value);
    countries.forEach(country => selections.add(country))
    selectedCountries.value = Array.from(selections)
  }

  fetchJson('/country_list').then(countries => items.value = countries);

  fetchJson('/region_country_map').then(regions => {
    menuItems.value = [{name:'All countries'}].concat(
      Object.keys(regions).map(region => {return {name: `All ${region}`}})
    );
    regionCountryMap.value = regions;
  });
</script>
