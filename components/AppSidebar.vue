<template>
  <aside class="w-314px p-10 flex flex-col justify-between bg-blue text-white">
    <header class="mb-5">
      <logo />
    </header>
    <footer>
      <dl class="mb-4">
        <dt class="font-bold">Email</dt>
        <dd>
          <a href="mailto:rafael.luan.gaedke@hotmail.com">rafael.luan.gaedke@hotmail.com</a>
        </dd>
      </dl>

      <dl class="mb-4">
        <dt class="font-bold">Telefone</dt>
        <dd><a href="tel:+5547997017721">47 997017721</a></dd>
      </dl>

      <dl>
        <dt class="font-bold">Siga-me nas redes:</dt>
        <dd>
          <ul class="flex">
            <li v-if="facebook" class="mr-4">
              <a
                href="https://www.facebook.com/rafael.gaedke"
                target="_blank"
                rel="noopener"
                aria-label="Find me on Facebook"
              >
                <facebook-icon class="svg-inline" />
              </a>
            </li>

            <li v-if="linkedin" class="mr-4">
              <a
                href="https://www.linkedin.com/in/rafgls/"
                target="_blank"
                rel="noopener"
                aria-label="Get to know be better via Linkedin"
              >
                <linkedin-icon class="svg-inline" />
              </a>
            </li>

            <li v-if="twitter" class="mr-4">
              <a
                :href="twitter"
                target="_blank"
                rel="noopener"
                aria-label="Follow me on Twitter"
              >
                <twitter-icon class="svg-inline" />
              </a>
            </li>

            <li v-if="github" class="mr-4">
              <a
                :href="github"
                target="_blank"
                rel="noopener"
                aria-label="Discover my projects on Github"
              >
                <github-icon class="svg-inline" />
              </a>
            </li>
            
          </ul>
        </dd>
      </dl>
    </footer>
  </aside>
</template>

<script>
import FacebookIcon from '~/assets/icons/facebook.svg?inline'
import LinkedinIcon from '~/assets/icons/linkedin.svg?inline'
import TwitterIcon from '~/assets/icons/twitter.svg?inline'
import GithubIcon from '~/assets/icons/github.svg?inline'

import {
  facebook,
  linkedin,
  twitter,
  github,
} from '~/docs/social.json'

export default {
  components: {
    FacebookIcon,
    LinkedinIcon,
    TwitterIcon,
    GithubIcon,
  },

  data() {
    return {
      facebook,
      linkedin,
      twitter,
      github,
    }
  }
}
</script>
