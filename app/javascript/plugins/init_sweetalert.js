import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.getElementById('submit-button');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options);
    });
  }
};

export { initSweetalert };
