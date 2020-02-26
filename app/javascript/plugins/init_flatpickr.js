import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
// import rangePlugin from "flatpickr/dist/plugins/rangePlugin"
// import "flatpickr/dist/themes/dark.css"




const initFlatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true,
    minDate: "today",
    inline: true,
    dateFormat: "Y-m-d H:i",
    enableTime: true,
    minTime: "9:00",
    maxTime: "21:00"
  })
}

export  {initFlatpickr};
