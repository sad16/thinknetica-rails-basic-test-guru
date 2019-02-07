document.addEventListener('turbolinks:load', function() {
  var userPasswordConfirmation = document.querySelector('#user_password_confirmation')

  if (userPasswordConfirmation) {
    userPasswordConfirmation.addEventListener('input', checkPasswordConfirmation)
  }
})

function checkPasswordConfirmation() {
  var userPassword = document.querySelector('#user_password')

  if (this.value.length == 0) {
    removeValidationClasses(userPassword)
    removeValidationClasses(this)
  }
  else if (userPassword.value == this.value) {
    addValidClass(userPassword)
    addValidClass(this)
  }
  else {
    addInvalidClass(userPassword)
    addInvalidClass(this)
  }
}

function removeValidationClasses(element) {
  element.classList.remove('is-valid', 'is-invalid')
}

function addValidClass(element) {
  removeСontainingСlass(element, 'is-invalid')
  element.classList.add('is-valid')
}

function addInvalidClass(element) {
  removeСontainingСlass(element, 'is-valid')
  element.classList.add('is-invalid')
}

function removeСontainingСlass(element, class_name) {
  if (element.classList.contains(class_name)) {
    element.classList.remove(class_name)
  }
}
