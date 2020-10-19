// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require jcanvas
//= require_tree .

$(document).ready(function () {
	$('.skippr').skippr({
		transition : 'slide',
	    // 変化に係る時間(ミリ秒)
	    speed : 1000,
	    // easingの種類
	    easing : 'easeOutQuart',
	    // ナビゲーションの形("block" or "bubble")
	    navType : 'block',
	    // 子要素の種類("div" or "img")
	    childrenElementType : 'div',
	    // ナビゲーション矢印の表示(trueで表示)
	    arrows : true,
	    // スライドショーの自動再生(falseで自動再生なし)
	    autoPlay : true,
	    // 自動再生時のスライド切替間隔(ミリ秒)
	    autoPlayDuration : 2000,
	    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
	    keyboardOnAlways : true,
	    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
	    hidePrevious : true
	});
});

$(function(){
  //querySelectorでfile_fieldを取得
  var file_field = document.querySelector('input[type=file]')
  //fileが選択された時に発火するイベント
  $('#post_post_images_post_images').change(function(){
    //選択したfileのオブジェクトをpropで取得
    var file = $('input[type="file"]').prop('files')[0];
    //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
    var fileReader = new FileReader();
    //読み込みが完了すると、srcにfileのURLを格納
    fileReader.onloadend = function() {
      var src = fileReader.result
      var html= `<div class='item-image' data-image="${file.name}">
             <div class=' item-image__content'>
               <div class='item-image__content--icon'>
                 <img src=${src} width="114" height="80" >
               </div>
             </div>
             <div class='item-image__operetion'>
               <div class='item-image__operetion--delete'>削除</div>
             </div>
           </div>`
      //image_box__container要素の前にhtmlを差し込む
      $('#image-box__container').before(html);
    }
    fileReader.readAsDataURL(file);
  });
});
$(document).on("click", '.item-image__operetion--delete', function(){
  //プレビュー要素を取得
  var target_image = $(this).parent().parent()
  //プレビューを削除
  target_image.remove();
  //inputタグに入ったファイルを削除
  file_field.val("")
})
