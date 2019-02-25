document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer');

  if (timer) {
    showTimer();
    setInterval(showTimer, 1000);
  }
})

function showTimer() {
  var timer = document.querySelector('.timer');
  var timer_seconds = parseInt(timer.dataset.second);

  if (timer_seconds == 0) { submitForm() }

  var seconds = timer_seconds % 60;
  var minutes = (timer_seconds - seconds) / 60;

  timer.textContent = `${minutes}:${seconds > 9 ? seconds : `0${seconds}`}`;

  timer.dataset.second = timer_seconds - 1;
}

function submitForm() {
  var form = document.querySelector('form');

  if (form) { form.submit() }
}
