$(document).on('turbolinks:load', function(){
  //カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  // 子カテゴリーの表示作成
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<select class='category' name='category_id' id='child_category'>
                        <option value='---' data-category='---'>---</option>
                         ${insertHTML}
                       </select>`;
    $('.contents-box__category-section__category-box__tag#async-select-box').append(childSelectHtml);
  }

  // 孫カテゴリーの表示作成
  function appendGrandchildBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `

    　　　　　　　<select class="category" name="good[category_id]" id="grandchild_category">
    　　　　　　　　<option value="---" data-category="---">---</option>
    　　　　　　　　${insertHTML}
    　　　　　　　</select>

    　　　　　　　`;
    $('.contents-box__category-section__category-box__tag#async-select-box').append(grandchildSelectHtml);
  }

  //function buildHTML_sub2() {
  //  var html  = `
  //              <select class="category" name="s2_category" id="garndchildren_category">
  //                <option value="データベースに登録するサブカテゴリ2a">表示する文字サブカテゴリ2a</option>
  //                <option value="データベースに登録するサブカテゴリ2b">表示する文字サブカテゴリ2b</option>
  //                <option value="データベースに登録するサブカテゴリ2c">表示する文字サブカテゴリ2c</option>
  //              </select>
  //              `
  //  return html;
  //}


   // $(document).on('change', '#s1_category', function () {
   // var s1_cat_id = $('s_category1').val();
   // console.log(s1_cat_id);
   // insertHTML = buildHTML_sub2();
   // $('#async-select-box').append(insertHTML)
   // });

    // 親カテゴリー選択後のイベント
    $('#parent_category').on('change', function(){
      var parentCategory = document.getElementById('parent_category').value;
      if (parentCategory != "---") {
        $.ajax({
          url: 'get_category_children',
          type: 'GET',
          data: { parent_name: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('#child_category').remove();
          $('#grandchild_category').remove();
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
        $('#grandchild_category').remove();
      }
      //console.log(m_cat_id);
      //insertHTML = buildHTML_sub1();
      //$('#async-select-box').append(insertHTML)
      // $('.category').append(insertHTML);
        // $.ajax({
        //   type: "GET",
        //   url: "/goods/search",
        //   data: {m_cat_id: m_cat_id},
        //   dataType: 'json'
        // })
    });

    // 子カテゴリー選択後のイベント
    $('.contents-box__category-section__category-box__tag#async-select-box').on('change', '#child_category', function(){
      var childId = $('#child_category option:selected').data('category');
      if (childId != "---"){
        $.ajax({
          url: 'get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchild_category').remove();
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
        $('#grandchild_category').remove();
      }
    });
});
