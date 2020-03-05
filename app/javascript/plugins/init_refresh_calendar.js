const initCalendar = () => {
  const btns = document.querySelectorAll('.calendar-btn');
  const teacher_btns = document.querySelectorAll('.js-initteacher');

  if (btns) {
    recurse(btns);
  }

  if (teacher_btns) {
    recurse(teacher_btns)
  }

  selectSlot();
}

const recurse = (elements) => {
  elements.forEach(element => {
    element.addEventListener('click', (e) => {
      event.preventDefault()
      const url = element.dataset.path

      fetch(url).then((response) => {
        return response.text()
      }).then(html => {
        const cont = document.querySelector('#container-calendar')
        cont.innerHTML = ""
        cont.insertAdjacentHTML('beforeend', html)
        const btns = document.querySelectorAll('.calendar-btn');
        selectSlot();
        recurse(btns)
        updateTeacherPath()
      })
    })
  })
}

const selectSlot = () => {
  //const next_btn = document.querySelector('.js-next-btn');
  let slots = document.querySelectorAll('.card-slot-free');
  const booked_slot = document.querySelector('.card-slot-clicked');
  slots = Array.from(slots)

  if (booked_slot) {
    slots.push(booked_slot);
    //next_btn.classList.remove('hidden');
  }

  if (slots) {
    slots.forEach ((slot) => {
      slot.addEventListener('click', () => {
        // Remove clicked class to previous clicked slot
        const clicked_slot = document.querySelector('.card-slot-clicked');
        if (clicked_slot) {
          clicked_slot.classList.replace('card-slot-clicked','card-slot-free');
        }

        // Add clicked class to new clicked slot
        slot.classList.replace('card-slot-free', 'card-slot-clicked');

        // Display the next button
        //next_btn.classList.remove('hidden');

        //Fill the form
        document.getElementById('booking_slot_attributes_start').value = `${slot.dataset.slot} ${slot.dataset.slotHour}:00`


      })
    })
  }
}

const updateTeacherPath = () => {
  const teacher_btns = document.querySelectorAll('.js-initteacher');
  const firstDate = document.querySelector('.calendar-container').dataset.firstDate

  teacher_btns.forEach(element => {
    let path = element.dataset.path
    const teacher_id = new URL(path, location).search.split('teacher_id=')[1]
    path = `/refresh_calendar?date=${firstDate}&teacher_id=${teacher_id}`
    element.setAttribute('data-path', path)
  })
}

export { initCalendar }
