function dateTime(value) {
    var yearGetById = document.getElementById("year");
    var monthGetById = document.getElementById("month");
    var dateGetById = document.getElementById("date");
    var hourGetById = document.getElementById("hour");
    var minuteGetById = document.getElementById("minute");
    var secondGetById = document.getElementById("second");
    var millisecondGetById = document.getElementById("Millisecond");
    var utcValue =  document.getElementById("utcValue");
    var localValue = document.getElementById("localValue");
    var utcMillisecondGetById=document.getElementById("utcMillisecondValue");
    if (value === 'dateTime') {
        var d = new Date();
        var fullYear = d.getFullYear();
        var month = d.getMonth() + 1;
        var date = d.getDate();
        var hour = d.getHours();
        var minute = d.getMinutes();
        var seconds = d.getSeconds();
        var milliseconds = d.getMilliseconds();
        var utc = d.toUTCString();
        var localDateTime = d.toLocaleString()
        var utcMillisecond = Date.UTC(
            d.getFullYear(),
            d.getMonth() + 1,
            d.getDate(),
            d.getSeconds(),
            d.getMilliseconds()
        );
        yearGetById.innerText = fullYear;
        monthGetById.innerText = month;
        dateGetById.innerText = date;
        hourGetById.innerText = hour;
        minuteGetById.innerText = minute;
        secondGetById.innerText = seconds;
        millisecondGetById.innerText = milliseconds;
        utcValue.innerText = utc;
        localValue.innerText = localDateTime;
        utcMillisecondGetById.innerText = utcMillisecond;

    } else if (value === 'clear') {
        yearGetById.innerText = '';
        monthGetById.innerText = '';
        dateGetById.innerText = '';
        hourGetById.innerText = '';
        minuteGetById.innerText = '';
        secondGetById.innerText = '';
        millisecondGetById.innerText = '';
        utcValue.innerText = '';
        localValue.innerText = '';
        utcMillisecondGetById.innerText = '';
    }
}
