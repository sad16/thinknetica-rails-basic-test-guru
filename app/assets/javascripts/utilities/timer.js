document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer');

  if (timer) {
    var timerSeconds = parseInt(timer.dataset.seconds);

    setInterval(function() {
      if (timerSeconds == 0) { submitAnswerForm() }

      var seconds = timerSeconds % 60;
      var minutes = (timerSeconds - seconds) / 60;

      timer.textContent = minutes + ':' + (seconds < 10 ? '0' + seconds : seconds);

      timerSeconds--;
    }, 1000);
  }
})

function submitAnswerForm() {
  var form = document.querySelector('#answer-form');

  if (form) { form.submit() }
}
