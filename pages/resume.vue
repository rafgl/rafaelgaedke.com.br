<template>
  <div class="flex">
   
    <div class="flex-1 pl-8">
      <div class="max-w-3/5">
        <h1 class="uppercase text-4xl font-black leading-none mb-10">
          Contact me
        </h1>

        <div class="p-6 shadow-lighter mb-8">
          <p class="font-bold mb-2">Email</p>
          <a href="mailto:emils.gulbis@gmail.com" class="hover:underline"
            >emils.gulbis@gmail.com</a
          >
        </div>

        <div class="p-6 mb-8">
          <p class="font-bold mb-2">Phone</p>
          <a href="tel:47 997017721" class="hover:underline"
            >+371 20 30 30 56</a
          >
        </div>

        <div class="p-6">
          <p class="font-bold mb-2">Addresss</p>
          <p>Mirdzas Kempes 3, Liepaja, Latvia, LV-3407</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        name: '',
        email: '',
        message: ''
      }
    }
  }
}
</script>
