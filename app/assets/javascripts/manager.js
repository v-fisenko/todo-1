function validatePassword(){

  var password = document.getElementById("manager_password")
    , confirm_password = document.getElementById("manager_password_confirmation");

  if(password.value != confirm_password.value) {
    confirm_password.setCustomValidity("Passwords Don't Match");
  } else {
    confirm_password.setCustomValidity('');
  }
}