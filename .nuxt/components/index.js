export { default as AppMenu } from '../../components/AppMenu.vue'
export { default as AppSidebar } from '../../components/AppSidebar.vue'
export { default as Burger } from '../../components/Burger.vue'
export { default as FormField } from '../../components/FormField.vue'
export { default as GoogleMaps } from '../../components/GoogleMaps.vue'
export { default as Logo } from '../../components/Logo.vue'

export const LazyAppMenu = import('../../components/AppMenu.vue' /* webpackChunkName: "components/AppMenu" */).then(c => c.default || c)
export const LazyAppSidebar = import('../../components/AppSidebar.vue' /* webpackChunkName: "components/AppSidebar" */).then(c => c.default || c)
export const LazyBurger = import('../../components/Burger.vue' /* webpackChunkName: "components/Burger" */).then(c => c.default || c)
export const LazyFormField = import('../../components/FormField.vue' /* webpackChunkName: "components/FormField" */).then(c => c.default || c)
export const LazyGoogleMaps = import('../../components/GoogleMaps.vue' /* webpackChunkName: "components/GoogleMaps" */).then(c => c.default || c)
export const LazyLogo = import('../../components/Logo.vue' /* webpackChunkName: "components/Logo" */).then(c => c.default || c)
