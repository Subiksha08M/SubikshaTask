var currentLocation = window.location.href;
stringPathName = window.location.pathname

window.onload = function () {
    getUrl();
};

function getUrl() {
    document.getElementById('url').innerHTML = stringPathName;
};
