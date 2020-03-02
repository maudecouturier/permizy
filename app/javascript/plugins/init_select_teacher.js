const initTeachers = () => {
  const teachers = document.querySelectorAll('.js-initteacher');

  if (teachers) {
    teachers.forEach(element => {
      element.addEventListener('click', (event) => {
        const teacher_id = element.dataset.userId;
        const teacher_form = document.getElementById('booking_slot_attributes_teacher');
        teacher_form.value = teacher_id;
        // Remove clicked class to previous clicked slot
        const clicked_teacher = document.querySelector('.teacher-selected');
        if (clicked_teacher) {
          clicked_teacher.classList.remove('teacher-selected');
        }
        element.classList.add('teacher-selected');
    });
});
  }
}

export { initTeachers };
