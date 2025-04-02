var displayBlock = "block";
var displayNone = "none";

function findVowelOrNot() {
  var validationError = document.getElementById("validationError");
  var ResultGetByElement = document.getElementById("result");
  var regex = /[0-9]/g;
  var specialCharactersRegex = /[-!$%^&*()_+|~=`{}\[\]:\/;<>?,.@#]/;
  let vowelRegex = /[aeiou]/i;
  validationError.style.display = displayNone;
  validationError.innerHTML = '';
  ResultGetByElement.style.display = displayNone;
  ResultGetByElement.innerHTML = '';
  var input = document.getElementById("inputField").value.trim().replace(/\s\s+/g, ' ');
  var array = input.split(" ");
  var vowelResult = "";
  if (!(input === null || input === "")) {
    if (array.length > 1) {
      var oneWordValidation ="Please enter only one word";
      validationError.innerHTML += oneWordValidation;
      validationError.style.display = displayBlock;
    }
    else if (regex.test(input)) {
      var numberValidation = "Number is not allowed";
      validationError.innerHTML += numberValidation;
      validationError.style.display = displayBlock;
    }
    else if (specialCharactersRegex.test(input)) {
      var numberValidation = "special character is not allowed";
      validationError.innerHTML += numberValidation;
      validationError.style.display = displayBlock;
    }
    else if (!(vowelRegex.test(input))) {
      var noWordValidation = "There is no vowel in this word";
      validationError.innerHTML += noWordValidation;
      validationError.style.display = displayBlock;
    }
    else {
      for (var i = 0; i < input.length; i++) {
        if (vowelRegex.test(input[i])) {
          if (!(vowelResult.includes(input[i]))) {
            vowelResult += input[i];
          }
        }
      }
      var vowelMessage = "Vowels in this word:";
      ResultGetByElement.style.display = displayBlock;
      var commaSeparator = vowelResult.split('').join(',');
      ResultGetByElement.innerHTML += vowelMessage + commaSeparator;
    }
  }
  else {
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