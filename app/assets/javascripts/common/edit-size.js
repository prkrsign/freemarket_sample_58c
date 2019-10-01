$(document).on('turbolinks:load', function() {
  // 編集ページが読み込まれたタイミングで、サイズのセレクトボックスと初期値を表示する処理。
  $(function(){
    var categoryNum = $('#child_category__edit').val();
    var x = parseInt(categoryNum);
    if ( x == 49 || x == 188 ||categoryNum == "---" ) {
    appendSizebox20();
    const str1 = $('input:hidden[name="good[size]"]').val();
    $('#good_size2_id').val(str1);
    }else if(
      x == 2 
      || x == 15
      || x == 39
      || x == 71
      || x == 141
      || x == 148
      || x == 161
      || x == 180
      || x == 254
      || categoryNum == "---") {
        appendSizebox10();
        const str1 = $('input:hidden[name="good[size]"]').val();
        $('#good_size_id').val(str1);
      };
  });

  function appendSizebox10(){
    var sizeHtml = '';
    sizeHtml = `
                <div class='contents-box__category-section__category-box__tag#size__edit1'>
                  <div class='contents-box__category-section__category-box__tag' id='good_size1'>
                  サイズ
                  <div class='form-require'>
                  必須
                  </div>
                  </div>
                <select class='category' name='good[size]' id='good_size_id' selected='selected'>
                  <option value='---' data-brand='---'>---</option>
                  <option value='XXS以下'>XXS以下</option>
                  <option value='XS(SS)'>XS(SS)</option>
                  <option value='S'>S</option>
                  <option value='M'>M</option>
                  <option value='L'>L</option>
                  <option value='XL(LL)'>XL(LL)</option>
                  <option value='2XL(3L)'>2XL(3L)</option>
                  <option value='3XL(4L)'>3XL(4L)</option>
                  <option value='4XL(5L)'>4XL(5L)</option>
                  <option value='FREE SIZE'>FREE SIZE</option>
                </select>
                </div>`;
    $('.contents-box__category-section__category-box__tag#size__edit1').append(sizeHtml);
  };

  function appendSizebox20(){
    var size2Html = '';
    size2Html = `
                 <div class='contents-box__category-section__category-box__tag#size__edit2'>
                    <div class='contents-box__category-section__category-box__tag' id='good_size2'>
                    サイズ
                    <div class='form-require'>
                    必須
                    </div>
                    </div>
                 <select class='category' name='good[size]' id='good_size2_id'>
                   <option value='---' data-brand='---'>---</option>
                   <option value='23.5cm以下'>23.5cm以下</option>
                   <option value='24cm'>24cm</option>
                   <option value='24.5cm'>24.5cm</option>
                   <option value='25cm'>25cm</option>
                   <option value='25.5cm'>25.5cm</option>
                   <option value='26cm'>26cm</option>
                   <option value='26.5cm'>26.5cm</option>
                   <option value='27cm'>27cm</option>
                   <option value='27.5cm'>27.5cm</option>
                   <option value='28cm'>28cm</option>
                   <option value='28.5cm'>28.5cm</option>
                   <option value='29cm'>29cm</option>
                   <option value='29.5cm'>29.5cm</option>
                   <option value='30cm'>30cm</option>
                   <option value='30.5cmcm'>30.5cmcm</option>
                   <option value='31cm以上'>31cm以上</option>
                 </select>
                 </div>`;
    $('.contents-box__category-section__category-box__tag#size__edit2').append(size2Html);
  };
  
  // カテゴリーが服と靴以外だった場合は、空のデータを送るようにしました。表示はしたくないので、type='hidden'にしてあります。
  function appendSizebox30 (){
    var size3Html = '';
    size3Html = `
                 <div class='contents-box__category-section__category-box__tag#size__edit3'>
                   <div class='contents-box__category-section__category-box__tag' type='hidden' id='good_size3'>
                   サイズ
                     <div class='form-require'>
                     必須
                     </div>
                   </div>
                   <select class='category' name='good[size]' id='good_size3_id'>
                     <option value='' data-brand='---'>---</option>
                   </select>
                </div>`;
     $('.contents-box__category-section__category-box__tag#size__edit3').append(size3Html);
  };

  //サイズ表示
  $('.contents-box__category-section__category-box__tag#async-select-box').on('change', '#grandchild_category__edit', function(){
    var categoryNum = $('#child_category__edit').val();
    var x = parseInt(categoryNum);
    if ( x == 49 || x == 188 || categoryNum == "---"){
      $('#good_size1').remove();
      $('#good_size_id').remove();
      $('#good_size2').remove();
      $('#good_size2_id').remove();
      $('#good_size3').remove();
      $('#good_size3_id').remove();
      appendSizebox20();
    }
    else if (
      x == 2 
      || x == 15
      || x == 39
      || x == 71
      || x == 141
      || x == 148
      || x == 161
      || x == 180
      || x == 254
      || categoryNum == "---"){
        $('#good_size1').remove();
        $('#good_size_id').remove();
        $('#good_size2').remove();
        $('#good_size2_id').remove();
        $('#good_size3').remove();
        $('#good_size3_id').remove();
        appendSizebox10();
    }
    else {
      var size3 = $('#size__edit3');
      appendSizebox30();
      size3.css ({
        'display':'none'
      })
    }
  });
});
