$(document).on('turbolinks:load', function(){

  function buildHTML_sub1() {
    var html  = `
                <select class="category" name="s1_category" id="s1_category">
                  <option value="">未選択</option>
                  <option value="データベースに登録するサブカテゴリ1a">表示する文字サブカテゴリ1a</option>
                  <option value="データベースに登録するサブカテゴリ1b">表示する文字サブカテゴリ1b</option>
                  <option value="データベースに登録するサブカテゴリ1c">表示する文字サブカテゴリ1c</option>
                </select>
                `
    return html;
  }

  function buildHTML_sub2() {
    var html  = `
                <select class="category" name="s2_category" id="s2_category">
                  <option value="データベースに登録するサブカテゴリ2a">表示する文字サブカテゴリ2a</option>
                  <option value="データベースに登録するサブカテゴリ2b">表示する文字サブカテゴリ2b</option>
                  <option value="データベースに登録するサブカテゴリ2c">表示する文字サブカテゴリ2c</option>
                </select>
                `
    return html;
  }


    $(document).on('change', '#s1_category', function () {
    var s1_cat_id = $('s_category1').val();
    console.log(s1_cat_id);
    insertHTML = buildHTML_sub2();
    $('#async-select-box').append(insertHTML)
    });


    $('#m_category').change( function(){
      var m_cat_id = $('#m_category').val();
      console.log(m_cat_id);
      insertHTML = buildHTML_sub1();
      $('#async-select-box').append(insertHTML)
      // $('.category').append(insertHTML);
        // $.ajax({
        //   type: "GET",
        //   url: "/goods/search",
        //   data: {m_cat_id: m_cat_id},
        //   dataType: 'json'
        // })
    });



});
