var displayBlock = "block";
var displayNone = "none";

function stringHandling() {
  var validationError = document.getElementById("validationError");
  var ResultGetByElement = document.getElementById("result");
  var regex = /[0-9]/g;
  var specialCharactersRegex = /[-!$%^&*()_+|~=`{}\[\]:\/;<>?,.@#]/;
  validationError.style.display = displayNone;
  validationError.innerHTML = '';
  ResultGetByElement.style.display = displayNone;
  ResultGetByElement.innerHTML = '';
  var input = document.getElementById("inputField").value.trim().replace(/\s\s+/g, ' ');
  if (input) {
    if (regex.test(input)) {
      var numberValidation = "Number(s) not allowed";
      validationError.innerHTML += numberValidation;
      validationError.style.display = displayBlock;
    } else if (specialCharactersRegex.test(input)) {
      var numberValidation = "Special Characters(s)  not allowed";
      validationError.innerHTML += numberValidation;
      validationError.style.display = displayBlock;
    } else if (input.length < 2) {
      var errorMessage = "Please enter a sentence with more then one character";
      validationError.innerHTML += errorMessage;
      validationError.style.display = displayBlock;
    } else if (input.charAt(0) === input.charAt(input.length - 1)) {
      var equalValidation = "First and last characters are same in the text";
      ResultGetByElement.style.display = displayBlock;
      ResultGetByElement.innerHTML = equalValidation;
    } else {
      var errorMessage = "First and last character are not same";
      validationError.innerHTML += errorMessage;
      validationError.style.display = displayBlock;
    }
  } else {
    var errorMessage = "Please enter a sentence";
    validationError.innerHTML += errorMessage;
    validationError.style.display = displayBlock;
  }
}

function reset() {
  var validationError = document.getElementById("validationError");
  var ResultGetByElement = document.getElementById("result");
  var displayNone = "none";
  document.getElementById("inputField").value = '';
  validationError.innerHTML = '';
  ResultGetByElement.innerHTML = '';
  validationError.style.display = displayNone;
  ResultGetByElement.style.display = displayNone;
}