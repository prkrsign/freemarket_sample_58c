function MoveCheck() {
  if ( confirm('本当に削除しますか？')) {
    window.location.href = "";
  }
  else {
    alert('キャンセルしました。')
  }
}