var displayBlock = "block";
var displayNone = "none";

function arithmeticOperation(value) {
    event.preventDefault()
    var input = document.getElementById("outputField").value = '';
    validationError.style.display = displayNone;
    validationError.innerHTML = '';
    var specialCharactersRegex = /[!$%^&*()_|~=`{}\[\]:\/;<>?@#]/;
    var letterRegex = /[a-zA-Z]/
    var input = document.getElementById("inputField").value.trim().replace(/\s+/g, "").replace(/,+/g, ',').replace(/^,|,$/g, "");
    var splitInput = input.split(",");
    console.log(splitInput);
    var sum = 0;
    var count = 0;
    var multiple = 1;
    if (input) {
        if (specialCharactersRegex.test(input)) {
            var spacialCharacter = "Special character(s) not allowed";
            validationError.innerHTML = spacialCharacter;
            validationError.style.display = displayBlock;
        } else if (letterRegex.test(input)) {
            var letterMessage = "Letter(s) not allowed";
            validationError.innerHTML = letterMessage;
            validationError.style.display = displayBlock;
        } else if (splitInput.length < 2) {
            var singleNumber = "Single number is not allowed as input because we need more than one number to manipulate";
            validationError.innerHTML = singleNumber;
            validationError.style.display = displayBlock;
        } else {
            for (i = 0; i < splitInput.length; i++) {
                if (!(Number(splitInput[i]))) {
                    count++;
                }
            }
            for (i = 0; i < splitInput.length; i++) {
                if (count > 0) {
                    var validMessage = "Please enter a valid number";
                    validationError.innerHTML = validMessage;
                    validationError.style.display = displayBlock;
                } else if (value === "add") {
                    sum = sum + parseFloat(splitInput[i]);
                    var sumMessage = "The sum of value: ";
                    document.getElementById("outputField").value = sumMessage + sum;
                } else {
                    multiple = multiple * splitInput[i];
                    var multipleValue = "The multiple of value: ";
                    document.getElementById("outputField").value = multipleValue + multiple;
                }
            }
        }
    } else {
        var enterNumberMessage = "Please enter a number";
        validationError.innerHTML = enterNumberMessage;
        validationError.style.display = displayBlock;
    }
}

function reset() {
    var validationError = document.getElementById("validationError");
    var displayNone = "none";
    document.getElementById("inputField").value = '';
    document.getElementById("outputField").value = '';
    validationError.innerHTML = '';
    validationError.style.display = displayNone;
}