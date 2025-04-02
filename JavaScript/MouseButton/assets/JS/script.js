var message = '';

function mouseButton(event) {
    if (event.button === 2) {
        message = 'Right button clicked!';
    } else if (event.button === 0) {
        message = 'Left button clicked!';
    } else {
        message = 'Middle button clicked!';
    }
    alert(message);
}