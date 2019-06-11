$(document).on('turbolinks:load', function(){
  const mainCategory = $('#main_category_form'),
        subCategory  = $('#sub_category_form'),
        categoryForm = $("#category_form"),
        subCategoryUrl= "/categories/sub_category",
        categoryUrl = "/categories/mini_category"

  // セレクトボックスを表示
  function showUpSelectBox(target){
    target.removeClass('hidden');
  }

  // セレクトボックスを隠す
  function concealSelectBox(target){
    target.addClass('hidden');
  }

  // カテゴリーが変わった時にリセットするため
  function emptyCategoryForm(target){
    target.empty();
  }

  // prompt:'---'で表記していた要素
  function appendCategoryFirstOptions(target){
    let html = `<option value="">---</option>`
    target.append(html);
  }

  // jsonデータを受け取り関数の中で処理している
  function appendCategoryOptions(target, categories){
    $.each(categories, function(index, category){
      let html = `<option value="${category.id}">${category.name}</option>`
      target.append(html);
    })
  }

  
  function selectedCategoryForm(target, target2, url){
    target.on('change', function(){
      let target_id = $(this).val();
      if(target_id != null){
        $.ajax({
          type: 'GET',
          url: url,
          data: {id: target_id},
          dataType: 'json',
        })
        .done(function(data){
          showUpSelectBox(target2);
          emptyCategoryForm(target2);
          appendCategoryFirstOptions(target2);
          appendCategoryOptions(target2, data);
        })
        .fail(function(error){
          alert(error.messages + 'エラーです')
        })
      } else if (target_id === ""){
        if (target == mainCategory){
          if (target.hasClass('hidden')){
            concealSelectBox(target2);
            emptyCategoryForm(target2);
          } else {
            concealSelectBox(target2);
            emptyCategoryForm(target2);
            concealSelectBox(categoryForm);
            emptyCategoryForm(categoryForm);
          }
        } else {
          concealSelectBox(target2);
          emptyCategoryForm(target2);
        }
      }
    });
  }
  selectedCategoryForm(mainCategory, subCategory, subCategoryUrl);
  selectedCategoryForm(subCategory, categoryForm, categoryUrl);
});