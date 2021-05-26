<template>
  <div class="flex">
    <div class="w-490px flex-grow-0">
      <form class="bg-black shadow p-10 mb-10" @submit.prevent="">
        <p class="text-white text-xl font-bold mb-10">Send a message</p>
        <form-field
          v-model="form.name"
          label="Your Name"
          type="text"
          class="mb-8"
        />

        <form-field
          v-model="form.email"
          label="Your Email"
          type="email"
          class="mb-8"
        />

        <form-field
          v-model="form.message"
          label="Your Message"
          type="textarea"
          class="mb-8"
        />

        <button
          class="uppercase text-white font-black tracking-widest w-full text-center p-3 rounded-full bg-blue"
        >
          Send
        </button>
      </form>

      <google-maps
        :lat="56.484392"
        :lng="21.017387"
        :zoom="4"
        class="h-300px"
      />
    </div>

    <div class="flex-1 pl-8">
      <div class="max-w-3/5">
        <h1 class="uppercase text-4xl font-black leading-none mb-10">
          Contact me
        </h1>

        <div class="p-6 shadow-lighter mb-8">
          <p class="font-bold mb-2">Email</p>
          <a href="mailto:rafael.luan.gaedke@hotmail.com" class="hover:underline"
            >rafael.luan.gaedke@hotmail.com</a
          >
        </div>

        <div class="p-6 mb-8">
          <p class="font-bold mb-2">Telefone</p>
          <a href="tel:+5547997017721" class="hover:underline"
            >47997017721</a
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
