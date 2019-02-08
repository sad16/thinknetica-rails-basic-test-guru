document.addEventListener('turbolinks:load', function() {
  var userPasswordConfirmation = document.querySelector('#user_password_confirmation');

  if (userPasswordConfirmation) {
    userPasswordConfirmation.addEventListener('input', checkPasswordConfirmation);
  }
})

function checkPasswordConfirmation() {
  var userPassword = document.querySelector('#user_password');

  if (this.value.length == 0) {
    removeValidationClasses(userPassword);
    removeValidationClasses(this);
  }
  else if (userPassword.value == this.value) {
    addValidClass(userPassword);
    addValidClass(this);
  }
  else {
    addInvalidClass(userPassword);
    addInvalidClass(this);
  }
}

function removeValidationClasses(element) {
  element.classList.remove('is-valid', 'is-invalid');
}

function addValidClass(element) {
  element.classList.remove('is-invalid');
  element.classList.add('is-valid');
}

function addInvalidClass(element) {
  element.classList.remove('is-valid');
  element.classList.add('is-invalid');
}
