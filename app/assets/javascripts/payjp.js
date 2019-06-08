$(document).on('turbolinks:load', function(){
  const form = $('#add-card');
  form.on('submit', function(e){
    e.preventDefault();
    Payjp.setPublicKey('pk_test_db731d8714c8a40ebc1793b4');
    let card = {
      number: parseInt($('#payment_card_no').val()),
      exp_month: parseInt($('#payment_card_expire_mm').val()),
      exp_year: parseInt($('#payment_card_expire_yy').val()),
      cvc: parseInt($('#security_code').val())
    };
    // console.log(typeof(card.cardNum)); => string
    Payjp.createToken(card, function(status, response){
      if(status === 200) {
        $('.form-group-card-num__input').removeAttr("name");  //removeすることでparamsにcard情報が残ることを防げる。
        $('.form-group-card-expire__input').removeAttr("name"); 
        $('.form-group-card-expire__input').removeAttr("name");
        $('.form-group-card-num__input').removeAttr("name");
        const token = response.id;
        form.append('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token);
        form.get(0).submit();
      } else {
        alert('エラーがありました');
        $(this).find('button').prop('disabled', 'true');
      }
    })


  })
});