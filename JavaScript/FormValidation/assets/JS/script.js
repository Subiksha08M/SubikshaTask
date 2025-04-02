var afterErrorBoxStyle = "1px solid grey";
var errorBoxStyle = "1px solid red";
function returnValue(fieldName) {
    return document.getElementById(fieldName).value;
}

function changeErrorMessageStyle(error, message, style, field) {
    event.preventDefault();
    error.innerHTML = message;
    field.style.border = style;
}

function resetMessageStyle(errorClear, Field, style) {
    errorClear.innerHTML = '';
    Field.style.border = style;
}

function validation() {
    var nameError = document.getElementById("nameError");
    var firstNameField = document.getElementById('firstName');
    var lastNameError = document.getElementById("lastNameError");
    var lastNameField = document.getElementById('lastName');
    var emailError = document.getElementById("emailError");
    var emailField = document.getElementById('email');
    var phoneError = document.getElementById("phoneError");
    var phoneField = document.getElementById('phone');
    var zipcodeError = document.getElementById("zipcodeError");
    var zipcodeField = document.getElementById('zipcode');
    afterErrorReset();
    var firstName = returnValue("firstName").trim();
    var lastName = returnValue("lastName").trim();
    var email = returnValue("email").trim();
    var phone = returnValue("phone");
    var zipcode = returnValue("zipcode");
    var phoneNoRegex = /[a-zA-z\W]/;
    var emailValidation = /[a-zA-Z0-9]+([_.+-][a-zA-Z0-9]+)*@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$/;
    var phone = document.getElementById("phone").value.replace(/\s/g, '');
    var zipcode = document.getElementById("zipcode").value.replace(/\s/g, '');
    if (!firstName) {
        changeErrorMessageStyle(nameError, 'First Name required', errorBoxStyle, firstNameField)
    }
    if (!lastName) {
        changeErrorMessageStyle(lastNameError, 'Last name required', errorBoxStyle, lastNameField)
    }
    if (!email) {
        changeErrorMessageStyle(emailError, 'Email required', errorBoxStyle, emailField)
    } else {
        if (!(emailValidation.test(email))) {
            changeErrorMessageStyle(emailError, 'Give proper Email', errorBoxStyle, emailField)
        }
    }
    if (!phone) {
        changeErrorMessageStyle(phoneError, 'Phone number required', errorBoxStyle, phoneField)
    } else {
        if (phone.length !== 10) {
            changeErrorMessageStyle(phoneError, 'Give a phone number with 10 digits!', errorBoxStyle, phoneField)
        } else if (phoneNoRegex.test(phone)) {
            changeErrorMessageStyle(phoneError, 'Give a valid phone number', errorBoxStyle, phoneField)
        }
    }
    if (zipcode) {
        if (zipcode.length !== 6) {
            changeErrorMessageStyle(zipcodeError, 'Give a zipcode with 6 digit!', errorBoxStyle, zipcodeField)
        } else if (phoneNoRegex.test(zipcode)) {
            changeErrorMessageStyle(zipcodeError, 'Give a valid zipcode', errorBoxStyle, zipcodeField)
        }
    }
}

function afterErrorReset() {
    var nameError = document.getElementById("nameError");
    var firstNameField = document.getElementById('firstName');
    var lastNameError = document.getElementById("lastNameError");
    var lastNameField = document.getElementById('lastName');
    var emailError = document.getElementById("emailError");
    var emailField = document.getElementById('email');
    var phoneError = document.getElementById("phoneError");
    var phoneField = document.getElementById('phone');
    var zipcodeError = document.getElementById("zipcodeError");
    var zipcodeField = document.getElementById('zipcode');
    resetMessageStyle(nameError, firstNameField, afterErrorBoxStyle);
    resetMessageStyle(lastNameError, lastNameField, afterErrorBoxStyle);
    resetMessageStyle(emailError, emailField, afterErrorBoxStyle);
    resetMessageStyle(phoneError, phoneField, afterErrorBoxStyle);
    resetMessageStyle(zipcodeError, zipcodeField, afterErrorBoxStyle);
}

function resetButton() {
    afterErrorReset();
}