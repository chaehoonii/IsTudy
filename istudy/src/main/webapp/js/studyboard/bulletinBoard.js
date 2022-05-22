
(function main() {
    'use strict';
    $('#lynda-link').mouseover(function () {
        this.style.color = 'yellow';
    });

    $('#lynda-link').mouseout(function () {
        this.style.color = '#30096A';
    });

    $('#lynda-link').click(function () {
        window.open('https://www.lynda.com/React-js-tutorials/Learn-React-js-Basics/519668-2.html');
    });
})();
