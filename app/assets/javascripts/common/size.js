$(document).on('turbolinks:load', function() {
  function appendSizebox(){
    var sizeHtml = '';
    sizeHtml = `
                <div class='contents-box__category-section__category-box__tag#size'>
                  <div class='contents-box__category-section__category-box__tag' id='good_size1'>
                  サイズ
                  <div class='form-require'>
                  必須
                  </div>
                  </div>
                <select class='category' name='good[size]' id='good_size_id'>
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
    $('.contents-box__category-section__category-box__tag#size').append(sizeHtml);
  };

  function appendSizebox2(){
    var size2Html = '';
    size2Html = `
                 <div class='contents-box__category-section__category-box__tag#size'>
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
    $('.contents-box__category-section__category-box__tag#size').append(size2Html);
  };

  //サイズ表示
  $('.contents-box__category-section__category-box__tag#async-select-box').on('change', '#grandchild_category', function(){
    var categoryNum = $('#child_category').val();
    var x = parseInt(categoryNum);
    if ( x == 49 || x == 188 || categoryNum == "---"){
      $('#good_size1').remove();
      $('#good_size_id').remove();
      $('#good_size2').remove();
      $('#good_size2_id').remove();
      appendSizebox2();
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
        appendSizebox();
    };
  });
});
