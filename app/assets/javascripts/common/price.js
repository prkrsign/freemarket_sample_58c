$(document).on('turbolinks:load', function() {
	// 編集時はすでに価格が入力されているため、ページロード時のタイミングで1度moneyCalc関数を実行する必要あり。
	moneyCalc();
  // 価格に金額が入力されると、moneyCalc関数が発動する。
	$(function() {
		$(document).on('keyup', '#sell_center', function() {
			moneyCalc();
    });
  });
  
	function moneyCalc() {
		let inputNum = $('#sell_center').val();
		let Input = parseInt(inputNum);
		if (Input < 300 || Input > 9999999 || inputNum == ""){
			$(".sales-commission").text("-");
			$(".sales-profit").text("-");
		}else{
      // 販売手数料は10パーセント
      let fee = parseInt(Input / 10);
      // 販売手数料と販売利益をそれぞれ計算する。
      // toLocaleStringメソッドは、対象のNumberクラスのオブジェクトを文字列に変換した結果を返す、らしい。
			$('.sales-commission').text('¥' + fee.toLocaleString());
			$('.sales-profit').text('¥' + (Input - fee).toLocaleString());
		};
	};
 });
 