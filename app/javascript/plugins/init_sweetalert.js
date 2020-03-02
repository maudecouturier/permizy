import swal from 'sweetalert';


const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector('.js-btn-submit');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options);
    });
  }
};

export { initSweetalert };
