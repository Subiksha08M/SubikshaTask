var displayBlock = "block";
var displayNone = "none";

function replaceElement() {
    var validationError = document.getElementById("validationError");
    var result = document.getElementById("result");
    validationError.style.display = displayNone;
    validationError.innerHTML = '';
    result.style.display = displayNone;
    result.innerHTML = '';
    var specialCharactersRegex = /[!$%^&*()_|~=`.{}\[\]:\/;<>?@#-'\\$&']/;
    var positionSpecialCharacterRegex = /[!$%^&*()_|~=`.{}\[\]:\/;<>?@#-'\\$&',]/;
    var input = document.getElementById("inputField").value.trim().replaceAll(' ', '').replace(/,+/g, ',').replace(/^,|,$/g, "");
    var position = document.getElementById("positionField").value.trim().replaceAll(' ', '');
    var newElementRegex = /^[+-]?[A-Za-z0-9]+$/
    var alphabetRegex = /[a-zA-Z]/;
    var alphaRegex = /^[+-]+[a-zA-z]/;
    var newElement = document.getElementById("newElement").value.trim().replaceAll(' ', '');
    var splitInput = input.split(",");
    var inputInvalidFilter = splitInput.filter(f => (!(newElementRegex.test(f))));
    var filterAlphabet = splitInput.filter(f1 => (alphabetRegex.test(f1)));
    var inputFinalRes = filterAlphabet.filter(f2 => (alphaRegex.test(f2)));
    var newElementCount = 0;
    if (alphabetRegex.test(newElement)) {
        if ((alphaRegex.test(newElement))) {
            newElementCount++;
        }
    }
    if (input) {
        if (specialCharactersRegex.test(input) || positionSpecialCharacterRegex.test(newElement) || positionSpecialCharacterRegex.test(position)) {
            var specialCharacterMessage = "Special character(s) not allowed";
            validationError.innerHTML = specialCharacterMessage;
            validationError.style.display = displayBlock;
        } else if (splitInput.length < 2) {
            var moreThenOneString = "Single string is not allowed as input";
            validationError.innerHTML = moreThenOneString;
            validationError.style.display = displayBlock;
        } else if (inputInvalidFilter.length > 0 || inputFinalRes.length > 0) {
            var inputValidMessage = "Please enter a valid input";
            validationError.innerHTML = inputValidMessage;
            validationError.style.display = displayBlock;
        } else if (!(position)) {
            var position = "Please enter a position";
            validationError.innerHTML = position;
            validationError.style.display = displayBlock;
        } else if (position < 0) {
            var negativeMessage = "positive number only allowed";
            validationError.innerHTML = negativeMessage;
            validationError.style.display = displayBlock;
        } else if (!(Number(position))) {
            var positionValidMessage = "Please enter a valid number in position";
            validationError.innerHTML = positionValidMessage;
            validationError.style.display = displayBlock;
        } else if (position === 0) {
            var negativeMessage = "Zero not allowed";
            validationError.innerHTML = negativeMessage;
            validationError.style.display = displayBlock;
        } else if (position > splitInput.length) {
            var len = splitInput.length;
            var arrayRange = "Position should be within array range Ex: 1 to " + len;
            validationError.innerHTML = arrayRange;
            validationError.style.display = displayBlock;
        } else if (!(newElement)) {
            var newElementMessage = "Please enter the new element";
            validationError.innerHTML = newElementMessage;
            validationError.style.display = displayBlock;
        } else if (!(newElementRegex.test(newElement)) || newElementCount > 0) {
            var newElementValidMessage = "Please enter a valid new element";
            validationError.innerHTML = newElementValidMessage;
            validationError.style.display = displayBlock;
        } else {
            splitInput[position - 1] = newElement;
            var resultMessage = "Array after replacing ";
            result.style.display = displayBlock;
            result.innerHTML = resultMessage + splitInput;
        }
    } else {
        var missingMessage = "Please enter a sentence";
        validationError.innerHTML = missingMessage;
        validationError.style.display = displayBlock;
    }
}

function reset() {
    var validationError = document.getElementById("validationError");
    var result = document.getElementById("result");
    var displayNone = "none";
    document.getElementById("inputField").value = '';
    document.getElementById("positionField").value = '';
    document.getElementById("newElement").value = '';
    validationError.innerHTML = '';
    validationError.style.display = displayNone;
    result.innerHTML = '';
    result.style.display = displayNone;
}