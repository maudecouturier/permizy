import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
// import rangePlugin from "flatpickr/dist/plugins/rangePlugin"
// import "flatpickr/dist/themes/dark.css"




const initFlatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true,
    minDate: "today",
    inline: true,
    dateFormat: "Y-m-d"
  })
}

export  {initFlatpickr};
