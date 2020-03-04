const initDisplayMap = () => {
  const next_btn = document.querySelector('.js-next-btn');
  const location_selection = document.querySelector('.js-location-selection')

  if (next_btn) {
    next_btn.addEventListener('click', (event) => {
      location_selection.classList.remove('hidden');
      next_btn.classList.add('hidden');
    });
  }
}

export { initDisplayMap }
