function disableRightClick(event) {
    if (event.button === 2) {
        alert("Mouse Right Click Disabled!");
    }
}
document.addEventListener('copy', function (event) {
    alert("Copying is disabled.");
});
