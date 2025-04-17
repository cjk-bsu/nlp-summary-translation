<template>
  <div id="app">
    <h1>NLP Research Translator</h1>
    <button @click="getSummary">Fetch Test Summary</button>
    <div v-if="summary">
      <h2>{{ summary.title }}</h2>
      <p>{{ summary.summary }}</p>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref } from 'vue'

const summary = ref<{ title: string; summary: string } | null>(null)

async function getSummary() {
  try {
    const res = await fetch('/api/summary')
    if (!res.ok) throw new Error('Request failed')
    summary.value = await res.json()
  } catch (err) {
    console.error('Error fetching summary:', err)
  }
}
</script>

<style scoped>
#app {
  max-width: 600px;
  margin: auto;
  text-align: center;
  padding-top: 3rem;
}
</style>
