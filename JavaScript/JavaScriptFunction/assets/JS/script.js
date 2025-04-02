var displayBlock = "block";
var displayNone = "none";

function largestNumber() {
    var validationError = document.getElementById("validationError");
    var resultGetByElement = document.getElementById("result");
    var specialCharactersRegex = /[!$%^&*()_|~=`{}\[\]:\/;<>?@#]/;
    var letterRegex = /[a-zA-Z]/
    validationError.style.display = displayNone;
    validationError.innerHTML = '';
    resultGetByElement.style.display = displayNone;
    resultGetByElement.innerHTML = '';
    var input = document.getElementById("inputField").value.trim().replace(/\s/g, '').replace(/,+/g, ',').replace(/^,|,$/g, "");
    var splitArray = input.split(",");
    var count = 0;
    if (input) {
        for (i = 0; i < splitArray.length; i++) {
            if (!(Number(splitArray[i]))) {
                count++;
            }
        }
        if (specialCharactersRegex.test(input)) {
            var specialCharacterValidation = "Special character(s) not allowed";
            validationError.innerHTML += specialCharacterValidation;
            validationError.style.display = displayBlock;
        } else if (splitArray.length < 2) {
            var lengthValidation = "Enter more then one number";
            validationError.innerHTML += lengthValidation;
            validationError.style.display = displayBlock;
        } else if (letterRegex.test(input)) {
            var letterValidation = "Letter(s) not allowed";
            validationError.innerHTML += letterValidation;
            validationError.style.display = displayBlock;
        } else if (count > 0) {
            var negativeNumberValidation = "Give a valid number";
            validationError.innerHTML += negativeNumberValidation;
            validationError.style.display = displayBlock;
        } else {
            largest(input);
        }
    } else {
        var errorMessage = "Please enter a number";
        validationError.innerHTML += errorMessage;
        validationError.style.display = displayBlock;
    }
}

function largest(input) {
    var resultGetByElement = document.getElementById("result");
    var numberArray = input.split(',');
    for (i = 0; i < numberArray.length; i++) {
        for (j = i + 1; j < numberArray.length; j++) {
            if (parseFloat(numberArray[i]) < parseFloat(numberArray[j])) {
                temp = numberArray[i];
                numberArray[i] = numberArray[j];
                numberArray[j] = temp;
            }
        }
    }
    if (Number(numberArray[0]) === Number(numberArray[numberArray.length - 1])) {
        var bothAreSame = "Both number are same";
        validationError.innerHTML += bothAreSame;
        validationError.style.display = displayBlock;
    } else {
        resultGetByElement.innerHTML = "The Largest number in the number is : " + numberArray[0];
        resultGetByElement.style.display = displayBlock;
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

