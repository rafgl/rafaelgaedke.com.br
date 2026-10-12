// Translations. English is the source in index.html; add a language by adding a key here.
// Same language pick as the Mesa, Som and Casa landing pages: ?lang=, then the saved choice, then the browser.
const STRINGS = {
  pt: {
    'nav.apps': 'Apps', 'nav.about': 'Sobre',
    'apps.eyebrow': 'Apps para Mac', 'apps.title': 'Três apps pequenos para a barra de menus do Mac.',
    'apps.lead': 'Mesa, Som e Casa. Teste cada um grátis por 14 dias; depois, uma licença libera os três. macOS 26 ou posterior, Apple silicon e Intel.',
    'apps.trial': '14 dias de teste grátis',
    'buy.title': 'Uma licença, três apps',
    'buy.lead': 'Uma chave libera Mesa, Som e Casa em até 3 Macs seus. Pague uma vez, sem assinatura.',
    'buy.cta': 'Comprar licença (Mesa, Som e Casa)', 'buy.wait': 'Abrindo o pagamento…',
    'buy.error': 'Não foi possível abrir o pagamento. Tente de novo.',
    'apps.mesa.kind': 'Janelas, alternador, área de transferência, sistema',
    'apps.mesa.pitch': 'Sua mesa inteira, num menu só.',
    'apps.mesa.body': 'Encaixe janelas, alterne entre todas elas, cole qualquer coisa que você copiou hoje e acompanhe o seu Mac. Um app pequeno na barra de menus no lugar de cinco.',
    'apps.mesa.cta': 'Conhecer o Mesa →',
    'apps.som.kind': 'Mixer de volume por app',
    'apps.som.pitch': 'Um volume para cada app do seu Mac.',
    'apps.som.body': 'Abaixe o Chrome, aumente o Spotify e cale aquela aba que não para de tocar. Na barra de menus, na mesa como widgets e na Central de Controle.',
    'apps.som.cta': 'Conhecer o Som →',
    'apps.casa.kind': 'Controle da casa',
    'apps.casa.pitch': 'Sua casa inteira, a um clique na barra de menus.',
    'apps.casa.body': 'Ligue o ar, ajuste a temperatura, controle a TV e as luzes sem pegar o celular. Widgets, Central de Controle e um painel na barra de menus, para aparelhos de várias marcas.',
    'apps.casa.cta': 'Conhecer o Casa →',
    'about.lead': 'Eu fiz estes apps. Também sou freelancer em desenvolvimento de software: sites e painéis web, APIs e integrações entre sistemas, apps mobile e melhorias de performance.',
    'about.earlier': 'Projetos anteriores:', 'about.cv': 'Acessar CV',
    'footer.cv': 'Acessar CV', 'footer.apps': 'Apps para Mac',
    'footer.mesa': 'Sua mesa inteira num menu só', 'footer.som': 'Um volume para cada app', 'footer.casa': 'Controle sua casa pelo Mac',
    'meta.title': 'Mesa, Som e Casa — apps para Mac de Rafael Mendonça',
  },
};

function pickLanguage() {
  const fromUrl = new URLSearchParams(location.search).get('lang');
  if (fromUrl) return fromUrl;
  try {
    const saved = localStorage.getItem('rm.lang');
    if (saved) return saved;
  } catch { /* storage unavailable */ }
  return (navigator.language || 'en').toLowerCase().split('-')[0];
}

const picked = pickLanguage();
const lang = STRINGS[picked] ? picked : 'en';
try { localStorage.setItem('rm.lang', lang); } catch { /* storage unavailable */ }
const t = (key, fallback) => STRINGS[lang]?.[key] ?? fallback;

document.documentElement.lang = lang === 'pt' ? 'pt-BR' : lang;
if (lang !== 'en') {
  for (const el of document.querySelectorAll('[data-i18n]')) el.textContent = t(el.dataset.i18n, el.textContent);
  document.title = t('meta.title', document.title);
}
for (const a of document.querySelectorAll('[data-lang]')) a.classList.toggle('active', a.dataset.lang === lang);
