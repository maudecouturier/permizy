import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.getElementById('banner-typed-text')) {
    new Typed('#banner-typed-text', {
      strings: ["Réinventons<br>votre expérience<br>de l'auto-école"],
      typeSpeed: 100,
      loop: false
    });
  }
}

export { loadDynamicBannerText };
