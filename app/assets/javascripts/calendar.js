
$(function () {
    $(document).on('turbolinks:load', function () {
        if ($('#calendar').length) {
            console.log('hi');
            function eventCalendar() {
                return $('#calendar').fullCalendar({
                });
            };
            function clearCalendar() {
                // $('#calendar').fullCalendar('delete');
                $('#calendar').html('');
            };

            $(document).on('turbolinks:load', function () {
                eventCalendar();
            });
            $(document).on('turbolinks:before-cache', clearCalendar);

            $('#calendar').fullCalendar({
                events: '/schedules.json',
                titleFormat: 'YYYY年 M月',
                dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
                header: {
                    left: '',
                    center: 'title',
                    right: 'today prev,next'
                },
                defaultTimedEventDuration: '03:00:00',
                buttonText: {
                    prev: '前',
                    next: '次',
                    prevYear: '前年',
                    nextYear: '翌年',
                    today: '今日',
                    month: '月',
                    week: '週',
                    day: '日'
                },
                timeFormat: "HH:mm",
                eventColor: '#63ceef',
                eventTextColor: '#000000',
            });
        }
    });
});