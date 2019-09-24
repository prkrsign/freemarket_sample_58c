$(document).on('turbolinks:load', function(){

    function buildHTML(){

        var html = `<div class=category-tree-box>
                    </div>
                    `
    return html;
    }


    $('#category-list-box').on('mouseover', function(){
        insertHTML = buildHTML
        $('#category-list-box').append(insertHTML);
    });

    $('#category-list-box').on('mouseout', function(){
        $('.category-tree-box').remove();
    });


})