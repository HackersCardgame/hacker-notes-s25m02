function setCookie(name, value, days) {
    var d = new Date();
    d.setTime(d.getTime() + (days * 24 * 60 * 60 * 1000));
    document.cookie = name + "=" + value + ";" + "expires="+ d.toUTCString() + ";path=/";
}
function getCookie(name) {
    var name = name + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}
function checkCookie(name) {
    var cookie = getCookie(name);
    if (cookie == "") {
        var cookieHTML = '<div class="cc_banner-wrapper">' + "\n";
            cookieHTML += '    <div class="cc_banner cc_container cc_container--open">' + "\n";
            cookieHTML += '        <a href="#null" data-cc-event="click:agree" class="cc_btn cc_btn_accept_all">' + Schaltflaechentext + '</a>' + "\n";
            cookieHTML += '        <p class="cc_message">' + Hinweistext;
            if (Infolink != '') {
                cookieHTML += ' <a rel="nofollow" data-cc-if="options.link" class="cc_more_info" href="' + Infolink + '">' + InfolinkText + '</a>' + '</p>';
            }
            cookieHTML += "\n";
            cookieHTML += '    </div>' + "\n";
            cookieHTML += '</div>';
        $('body').prepend(cookieHTML);
        if (Position == 'unten') {
            $('.cc_container').css('display', 'none').css('bottom', '-' + ($('.cc_container--open').height() + Number($('.cc_container--open').css('padding-top').replace('px', '')) + Number($('.cc_container--open').css('padding-bottom').replace('px', ''))) + 'px');
            $('.cc_container').css('display', 'block').animate({
                'bottom': '0px'
            }, 800);
        }
        else if (Position == 'oben') {
            $('.cc_container').css('display', 'none').css('top', '-' + ($('.cc_container--open').height() + Number($('.cc_container--open').css('padding-top').replace('px', '')) + Number($('.cc_container--open').css('padding-bottom').replace('px', ''))) + 'px');
            $('.cc_container').css('display', 'block').animate({
                'top': '0px'
            }, 800);
        }
    }
}
function cookieHinweis() {
    checkCookie('CookieHinweis_agree');
    $('.cc_btn_accept_all').click(function(e) {
        e.preventDefault();
        setCookie('CookieHinweis_agree', 'yes', 30);
        if (Position == 'unten') {
            $('.cc_container').animate({
                'bottom': '-' + ($('.cc_container--open').height() + Number($('.cc_container--open').css('padding-top').replace('px', '')) + Number($('.cc_container--open').css('padding-bottom').replace('px', ''))) + 'px'
            }, 800);
        }
        else if (Position == 'oben') {
            $('.cc_container').animate({
                'top': '-' + ($('.cc_container--open').height() + Number($('.cc_container--open').css('padding-top').replace('px', '')) + Number($('.cc_container--open').css('padding-bottom').replace('px', ''))) + 'px'
            }, 800);
        }
        setTimeout(function() {
            $('.cc_banner-wrapper').css('display', 'none');
        }, 800);
    });
}