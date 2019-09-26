$(document).on('turbolinks:load', function(){

    function buildHTML(){
        var html = `<div class=category-tree-box>
                      <div class=category-tree-box__main-category>
                        レディース
                      </div>
                    </div>
                    `
    return html;
    }


    // カテゴリボックスにカーソルを合わせると発火
    $('#category-list-box').hover(
        function () {
          insertHTML = buildHTML
          $('#category-list-box').append(insertHTML);
        },
        function () {
          $('.category-tree-box').remove();
        }
      );

    // 追加された要素に対して、マウスホバーした背景の色を変える
    $(document).on({
        'mouseenter': function() {
            $(this).css({'background-color':'rgb(234, 53, 45)','color':'#fff'});
        },
        //マウスを離したときの動作
        'mouseleave': function() {
            $(this).css({'background':'', 'color':''});
        }
    }, '.category-tree-box__main-category'); // ←追加した要素の定義
  })
