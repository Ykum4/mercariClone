$(document).on('turbolinks:load', function(){
  const inputPriceForm = $('.input-price-form input'),
        lowestPrice = 300,
        highestPrice = 9999999;
  // 販売可能価格を確認
  function isPosssibleToCal(price){
    result = price >= lowestPrice && price <= highestPrice // => 変数にはしない！
    return result // => true or falseを返す
  }

  // 販売手数料、販売利益を表示させる関数
  function calculate(price){
    if (isPosssibleToCal(price)){
      let fee = Math.floor(price * 0.1);
      let profit = parseInt(price - fee);

      $('#yourFee').text(fee);
      $('.sell-profit-number').text(`¥${profit}`);
    } else {
      $('#yourFee').text("ー");
      $('.sell-profit-number').text("");
    }
  }

  inputPriceForm.on('keyup', function(){
      let inputPrice = $(this).val(); // lowestPriceと比べる時は互いにstringだからここでparseする必要なし
      calculate(inputPrice);
  });
});