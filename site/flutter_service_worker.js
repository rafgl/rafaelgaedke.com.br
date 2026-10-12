// The previous Flutter build registered a service worker at this path. Browsers that still have it
// fetch this file on their next visit; it clears the old caches, unregisters itself and reloads the
// open tabs so they get the static site.
self.addEventListener('install', () => self.skipWaiting());
self.addEventListener('activate', (event) => {
  event.waitUntil((async () => {
    for (const key of await caches.keys()) await caches.delete(key);
    await self.registration.unregister();
    for (const client of await self.clients.matchAll({ type: 'window' })) client.navigate(client.url);
  })());
});
