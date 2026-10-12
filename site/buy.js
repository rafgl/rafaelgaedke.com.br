// "Buy license": one key for Mesa, Som and Casa. Same license server as the app landings; checkout
// works signed out, so there is no Google sign-in here. Needs app.js (for `t`).
const LICENSE_SERVER = 'https://htgwqecyjijjbayeooix.supabase.co/functions/v1/license';

const buyButton = document.getElementById('buy-bundle');
buyButton?.addEventListener('click', async () => {
  const error = buyButton.parentElement.querySelector('.buy-error');
  const label = buyButton.textContent;
  buyButton.disabled = true;
  error.hidden = true;
  buyButton.textContent = t('buy.wait', 'Opening checkout…');
  try {
    const response = await fetch(`${LICENSE_SERVER}/checkout`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ app: 'rlg', lang: document.documentElement.lang.startsWith('pt') ? 'pt' : 'en' }),
    });
    const { url } = await response.json();
    if (!response.ok || !url) throw new Error('checkout');
    location.href = url;
  } catch {
    buyButton.disabled = false;
    buyButton.textContent = label;
    error.textContent = t('buy.error', 'Could not open checkout. Please try again.');
    error.hidden = false;
  }
});
// Back from the browser's back button after leaving for Stripe: re-enable the button.
addEventListener('pageshow', (e) => { if (e.persisted && buyButton) { buyButton.disabled = false; buyButton.textContent = t('buy.cta', 'Buy license (Mesa, Som & Casa)'); } });
