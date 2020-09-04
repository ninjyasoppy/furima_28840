if (document.URL.match(/new/) || document.URL.match(/edit/)) {
  document.addEventListener('DOMContentLoaded', function () {
    const imageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');// 画像を表示するためのdiv要素を生成
      const blobImage = document.createElement('img');// 表示する画像を生成
      blobImage.className = 'image-preview';
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);// 生成したHTMLの要素をブラウザに表示させる
      imageList.appendChild(imageElement);
    };

    document.getElementById('item-image').addEventListener('change', function (e) {
      const imageContent = document.querySelector('img');// 画像が表示されている場合のみ、すでに存在している画像を削除する
      if (imageContent) {
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);//関数呼び出し
    });
  });
}