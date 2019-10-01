$(document).on('turbolinks:load', function(){
  //カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  // 子カテゴリーの表示作成
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `
                       <select class='category' name='good[child]' id='child_category__edit'>
                         <option value='---' data-category='---'>---</option>
                          ${insertHTML}
                       </select>
                      `;
    $('.contents-box__category-section__category-box__tag#async-select-box').append(childSelectHtml);
  }

  // 孫カテゴリーの表示作成
  function appendGrandchildBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `
                            <select class='category' name='good[category_id]' id='grandchild_category__edit'>
                             <option value='---' data-category='---'>---</option>
                              ${insertHTML}
                            </select>
                           `;
    $('.contents-box__category-section__category-box__tag#async-select-box').append(grandchildSelectHtml);
  }

  function appendOption2(delivery){
    var html = `<option value="${delivery.id}" data-delivery="${delivery.id}">${delivery.name}</option>`;
    return html;
  }

  function appendChildrenBox2(insertHTML){
    var child2SelectHtml = '';
    child2SelectHtml = `<div class='contents-box__category-section__category-box__tag#async-select-box3'>
                          <div class='contents-box__category-section__category-box__tag' id='delivery-method__edit'>
                            配送の方法
                            <div class='form-require'>
                              必須
                            </div>
                          </div>
                          <select class='category' name='good[delivery_id]' id='child_delivery__edit'>
                            <option value='---' data-delivery='---'>---</option>
                              ${insertHTML}
                          </select>
                        </div>`;
    $('.contents-box__category-section__category-box__tag#async-select-box3').append(child2SelectHtml);
  }


    // 親カテゴリー選択後のイベント
    $('#parent_categoryedit').on('change', function(){
      var parentCategory = document.getElementById('parent_categoryedit').value;
      if (parentCategory != "---") {
        $.ajax({
          url: '../get_category_children',
          type: 'GET',
          data: { parent_name: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('#child_category__edit').remove();
          $('#grandchild_category__edit').remove();
          $('#good_size1').remove();
          $('#good_size2').remove();
          $('#good_size_id').remove();
          $('#good_size2_id').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChildrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchild_category__edit').remove();
      }
    });

    // 子カテゴリー選択後のイベント
    $('.contents-box__category-section__category-box__tag#async-select-box').on('change', '#child_category__edit', function(){
      var childId = $('#child_category__edit option:selected').data('category');
      if (childId != "---"){
        $.ajax({
          url: '../get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchild_category__edit').remove();
            $('#good_size1').remove();
            $('#good_size2').remove();
            $('#good_size_id').remove();
            $('#good_size2_id').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchildBox(insertHTML);
          }
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchild_category__edit').remove();
      }
    });

    $('#parent_delivery__edit').on('change', function(){
      var parentDelivery = document.getElementById('parent_delivery__edit').value;
      if (parentDelivery != "---") {
        $.ajax({
          url: '../get_delivery_children',
          type: 'GET',
          data: { parent_name: parentDelivery },
          dataType: 'json'
        })
        .done(function(children2){
          $('#async-select-box3').empty();
          $('#delivery-method__edit').remove();
          $('#child_delivery__edit').remove();
          var insertHTML = '';
          children2.forEach(function(child2){
            insertHTML += appendOption2(child2);
          });
          appendChildrenBox2(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchild_category__edit').remove();
      }
    });
});
