function checkbox(value) {
    event.preventDefault()
    var checkbox = document.querySelectorAll(".checkboxClass");
    for (i = 0; i < checkbox.length; i++) {
        if (value === 'check') {
            checkbox[i].checked = true;
        } else if (value === 'uncheck') {
            checkbox[i].checked = false;
        } else {
            checkbox[i].checked = !checkbox[i].checked;
        }
    }
}