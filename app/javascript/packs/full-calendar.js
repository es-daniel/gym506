import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import esLocale from '@fullcalendar/core/locales/es';

$(document).on('turbolinks:load', function () {
    var calendarEl = document.getElementById('calendar');

    if (calendarEl) {
        var calendar = new Calendar(calendarEl, {
            plugins: [dayGridPlugin, interactionPlugin],
            defaultView: 'dayGridWeek',
            editable: false,
            locale: esLocale,
            events: [
                {
                    id: '1',
                    title: 'Clase de natación',
                    start: '2019-12-04T10:30:00',
                }
            ]
        });

        calendar.render();
    }
});