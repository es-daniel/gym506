$(document).on('turbolinks:load', function () {
    initFileNameEvent();
    initSelectPicker();
    $('[data-toggle="tooltip"]').tooltip();
    initGoTopButton();
});

function initFileNameEvent() {
    $('input[type="file"]').change(function(e){
        fileName = 'Seleccione un archivo';
        if (e.target.files[0] !==undefined) fileName = e.target.files[0].name;
        $(this).next('.custom-file-label').html(fileName);
    });
}

function initSelectPicker() {
    $('.selectpicker').selectpicker();
    $('.selectpicker').addClass('bootstrap-selectpicker')
}

function initGoTopButton() {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
        clearTimeout($.data(this, 'scrollTimer'));
        $.data(this, 'scrollTimer', setTimeout(function() {
            $('#back-to-top').fadeOut();
        }, 1000));
    });
    // scroll body to 0px on click
    $('#back-to-top').click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 400);
        return false;
    });


}