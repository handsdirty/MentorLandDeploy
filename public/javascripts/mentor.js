(function($) {
$('a[data-toggle="tab"]').on('click', function (e) {
    var tab = $(this).attr('href');
    localStorage.setItem('lastTab', tab);
  });
  //go to the latest tab, if it exists:
  var lastTab = localStorage.getItem('lastTab');
  $('a[href='+lastTab+']').click();

$(document).ready(function () {
    $('.pagination .previous_page').text('«');
    $('.pagination .next_page').text('»');

    $('.pagination').each(function () {
        var $bar = $(this);
        $bar.find('a, .current, span').wrapAll('<ul>');
        $bar.find('a, .current, span').wrap('<li>');

        $bar.find('em').each(function () {
            $(this).parent().addClass('disabled');
            $(this).replaceWith('<a href="#">' + $(this).text() + '</a>');
        });
    });
});

})(jQuery);