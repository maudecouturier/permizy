
const initCalendar = () => {
  const btns = document.querySelectorAll('.calendar-btn');

  if (btns) {
    recurse(btns)
  }
}

const recurse = (elements) => {
  elements.forEach(element => {
    element.addEventListener('click', (e) => {
      event.preventDefault()
      const url = element.href

      fetch(url).then((response) => {
        return response.text()
      }).then(html => {
        const cont = document.querySelector('#container-calendar')
        cont.innerHTML = ""
        cont.insertAdjacentHTML('beforeend', html)
        const btns = document.querySelectorAll('.calendar-btn');
        recurse(btns)
      })
    })
  })
}

export { initCalendar }
