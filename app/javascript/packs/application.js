// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
import '@fortawesome/fontawesome-free/js/all'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener('DOMContentLoaded', () => {
  // ナビゲーションバーガー（navbar-burgerクラスを持つすべての要素）を取得します。
  const $navbarBurgers = document.querySelectorAll('.navbar-burger');
  // ナビゲーションバーガーがあるかどうかを確認します。
  if ($navbarBurgers.length > 0) {
    // すべてのナビゲーションバーガーをループします。
    $navbarBurgers.forEach( el => {
      // ナビゲーションバーガーにクリックイベントを追加します。
      el.addEventListener('click', () => {
        // ナビゲーションバーガーのdata-target属性の値を取得します。
        const target = el.dataset.target;
        // メニュー（data-target属性の値をIDとして持つ要素）を取得します。
        const $target = document.getElementById(target);
        // ナビゲーションバーガーでis-activeクラスを切り替えます。
        el.classList.toggle('is-active');
        // メニューでis-activeクラスを切り替えます。
        $target.classList.toggle('is-active');
      });
    });
  }
});