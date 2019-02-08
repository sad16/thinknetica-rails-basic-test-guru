document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar');

  if (progressBar) { updateProgressBar(progressBar) }
})

function updateProgressBar(progress_bar) {
  var valueNow = parseFloat(progress_bar.dataset.valueNow);
  var valueMax = parseFloat(progress_bar.dataset.valueMax);
  var width = valueNow / valueMax * 100;

  progress_bar.style.width = width + '%';
}
