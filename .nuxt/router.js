import Vue from 'vue'
import Router from 'vue-router'
import { interopDefault } from './utils'
import scrollBehavior from './router.scrollBehavior.js'

const _4c3b2d4d = () => interopDefault(import('../pages/contact.vue' /* webpackChunkName: "pages/contact" */))
const _1b3ce935 = () => interopDefault(import('../pages/portfolio.vue' /* webpackChunkName: "pages/portfolio" */))
const _3dc6e1e0 = () => interopDefault(import('../pages/resume.vue' /* webpackChunkName: "pages/resume" */))
const _3b7e2845 = () => interopDefault(import('../pages/api/hello.js' /* webpackChunkName: "pages/api/hello" */))
const _7d4c2a3f = () => interopDefault(import('../pages/index.vue' /* webpackChunkName: "pages/index" */))
const _e5a6132c = () => interopDefault(import('../pages/_app.js' /* webpackChunkName: "pages/_app" */))

// TODO: remove in Nuxt 3
const emptyFn = () => {}
const originalPush = Router.prototype.push
Router.prototype.push = function push (location, onComplete = emptyFn, onAbort) {
  return originalPush.call(this, location, onComplete, onAbort)
}

Vue.use(Router)

export const routerOptions = {
  mode: 'history',
  base: decodeURI('/'),
  linkActiveClass: 'nuxt-link-active',
  linkExactActiveClass: 'nuxt-link-exact-active',
  scrollBehavior,

  routes: [{
    path: "/contact",
    component: _4c3b2d4d,
    name: "contact"
  }, {
    path: "/portfolio",
    component: _1b3ce935,
    name: "portfolio"
  }, {
    path: "/resume",
    component: _3dc6e1e0,
    name: "resume"
  }, {
    path: "/api/hello",
    component: _3b7e2845,
    name: "api-hello"
  }, {
    path: "/",
    component: _7d4c2a3f,
    name: "index"
  }, {
    path: "/:app",
    component: _e5a6132c,
    name: "app"
  }],

  fallback: false
}

export function createRouter () {
  return new Router(routerOptions)
}
