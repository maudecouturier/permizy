import Chart from 'chart.js';
var moment = require('moment');
moment().format();
// chart.js n'est pas un fichier .js c'est une extension suite à l'installation de Chart.js



const myChart = () => {
  const ctx = document.getElementById('myChart');
  if (ctx) {
    const respect = JSON.parse(ctx.dataset.respect)
    const share = JSON.parse(ctx.dataset.share)
    const control = JSON.parse(ctx.dataset.control)
    const labels = JSON.parse(ctx.dataset.labels);
    const dates = labels.map(date => (new Date(date)).setHours(0));

    new Chart(ctx, {
      type: 'line',
      data: {
          labels: dates,
          datasets: [{
              // label: 'Appréhender la route',
              data: respect,
              backgroundColor: '#24418C',
              borderColor: '#24418C',
              borderWidth: 5,
              fill: false
          },
          {
              // label: 'Partager la route',
              data: share,
              backgroundColor: '#47A1BD',
              borderColor: '#47A1BD',
              borderWidth: 5,
              fill: false
          },
          {
              // label: 'Maitriser son véhicule',
              data: control,
              backgroundColor: '#F86513',
              borderColor: '#F86513',
              borderWidth: 5,
              fill: false
          }]
      },
      options: {
          layout: {
            padding: {
                left: 10,
                right: 10,
                top: 10,
                bottom: 10
            }
          },
          scales: {
              yAxes: [{
                  display: false,
                  scaleLabel: {
                    display: false,
                    fontColor: "#274060",
                  },
                  ticks: {
                    beginAtZero: true,
                    fontColor: "#274060",
                    stepSize: 1,
                    min: 0,
                    max: 5,
                  },
                  gridLines: {
                    offsetGridLines: false,
                    display: false
                  },
              }],
              xAxes: [{
                  display: true,
                  position: 'top',
                  scaleLabel: {
                    display: false,
                  },
                  type: 'time',
                  time: {
                    unit: 'day',
                  },
                  ticks: {
                    fontColor: "#274060",
                  },
                  gridLines: {
                    offsetGridLines: false,
                    display: true,
                  }
              }]
          },
          legend: {
                display: false,
                labels: {
                    fontColor: "#274060",
                    usePointStyle: true,
                },
                position: "bottom"
          }
      }
    });
  }
}

export { myChart }
