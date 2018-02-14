'use strict';

var rawCookies = '';

function set_development_tools_status(partials_checkbox, routing_checkbox) {
    var partials_value = partials_checkbox ? '1':'0';
    var routing_value = routing_checkbox ? '1':'0';

    rawCookies.set('development_tools', partials_value + routing_value, {expires: 10 * 365, path: '/'});

    location.reload();
}

function update_ui() {
    var cookie_value = rawCookies.get('development_tools');
    var cookie_bits = cookie_value.split("");


    $('.development-tools-panel #partials_checkbox').prop('checked', cookie_bits[0] == '1');
    $('.development-tools-panel #routing_checkbox').prop('checked', cookie_bits[1] == '1');
}


$(function () {
    rawCookies = Cookies.withConverter(function (value) {
        return value;
    });

    update_ui();

    $('.development-tools-panel input').change(function () {
        set_development_tools_status($('.development-tools-panel #partials_checkbox').is(':checked'), $('.development-tools-panel #routing_checkbox').is(':checked'));
    });
});