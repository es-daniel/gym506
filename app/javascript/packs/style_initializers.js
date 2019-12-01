$(document).on('turbolinks:load', function () {
    initFileNameEvent();
    initSelectPicker();
    $('[data-toggle="tooltip"]').tooltip();
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