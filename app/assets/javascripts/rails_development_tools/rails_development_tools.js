(function ($) {


    var $container = $("<div/>")
    $container.css('position','fixed');

    $container.attr('id','partials-container');

    var $title = $("<div/>").html('Partial views');

    $title.attr('id','title');

    $container.append($title);

    var partials = [];

    $(".development-tools-partials-info").each(function( index ) {

        partial = $(this).attr('title');
        if (partials.includes(partial)){
            $(this).remove();
            return true;
        }

        partials.push(partial);

        $(this).prepend(partials.length + ')');

        var $singlePartial = $("<div/>").html($(this).html() );
        var y_offset = 50 + partials.length * 30;

        $singlePartial.addClass('single-partial');
        $singlePartial.css('top', y_offset + 'px');
        $singlePartial.attr('id', 'partial-name-' + partials.length);

        $singlePartial.mouseenter(function() {
            $(this).addClass('single-selected');

            var partial_number_selector = '#' + $(this).attr('id').replace('name','number');
            $(partial_number_selector).addClass('single-selected');
        });

        $singlePartial.mouseleave(function() {
            $(this).removeClass('single-selected');

            var partial_number_selector = '#' + $(this).attr('id').replace('name','number');
            $(partial_number_selector).removeClass('single-selected');
        });

        $container.append( $singlePartial );
        $('body').prepend( $container );

        var $circle = $("<div/>").html(partials.length);

        $circle.attr('id', 'partial-number-' + partials.length);
        $circle.addClass('single-circle');

        $circle.mouseenter(function() {
            $(this).addClass('single-selected');

            var partial_name_selector = '#' + $(this).attr('id').replace('number','name');
            $(partial_name_selector).addClass('single-selected');
        });

        $circle.mouseleave(function() {
            $(this).removeClass('single-selected');

            var partial_name_selector = '#' + $(this).attr('id').replace('number','name');
            $(partial_name_selector).removeClass('single-selected');
        });

        $(this).html($circle);
    });

})(jQuery);