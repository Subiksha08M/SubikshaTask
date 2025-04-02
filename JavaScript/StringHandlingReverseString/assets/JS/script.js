var displayBlock = "block";
var displayNone = "none";

function reverseString() {
    var validationError = document.getElementById("validationError");
    var resultGetByElement = document.getElementById("result");
    var specialCharactersRegex = /[-!$%^&*()_+|~=`{}\[\]:\/;<>?,.@#]/;
    validationError.style.display = displayNone;
    validationError.innerHTML = '';
    resultGetByElement.style.display = displayNone;
    resultGetByElement.innerHTML = '';
    var input = document.getElementById("inputField").value.trim().replace(/\s\s+/g, ' ');
    if (input) {
        if (specialCharactersRegex.test(input)) {
            var specialCharacterValidation = "Special character(s) not allowed";
            validationError.innerHTML += specialCharacterValidation;
            validationError.style.display = displayBlock;
        } else if (input.length < 2) {
            var oneCharacterValidation = "Enter more then one character";
            validationError.innerHTML += oneCharacterValidation;
            validationError.style.display = displayBlock;
        } else {
            var reversedString = "";
            for (var i = input.length - 1; i >= 0; i--) {
                reversedString += input[i];
            }
            var reverseStringMessage = "Reverse string of your given input : ";
            resultGetByElement.style.display = displayBlock;
            resultGetByElement.innerHTML = reverseStringMessage + " " + reversedString;
        }
    } else {
        var errorMessage = "Please enter a sentence";
        validationError.innerHTML += errorMessage;
        validationError.style.display = displayBlock;
    }
}

function reset() {
    var validationError = document.getElementById("validationError");
    var resultGetByElement = document.getElementById("result");
    var displayNone = "none";
    document.getElementById("inputField").value = '';
    validationError.innerHTML = '';
    resultGetByElement.innerHTML = '';
    validationError.style.display = displayNone;
    resultGetByElement.style.display = displayNone;
}