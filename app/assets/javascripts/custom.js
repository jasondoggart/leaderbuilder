document.addEventListener('turbolinks:load', function() {
  FontAwesome.dom.i2svg();
});

function showSpinner(divid) {
  const div = document.querySelector(divid);
  div.innerHTML = '<div class="loading-spinner"><div class="spinner"><i class="fas fa-spinner fa-spin"></i></div><div class="spinner-text">Loading</div></div>'
}
