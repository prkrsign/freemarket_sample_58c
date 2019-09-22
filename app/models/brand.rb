class Brand < ActiveHash::Base
  self.data = [
    {id: 1, name: 'シャネル'}, {id: 2, name: 'ナイキ'}, {id: 3, name: 'ルイ ヴィトン'},
    {id: 4, name: 'シュプリーム'}, {id: 5, name: 'アディダス'}, {id: 6, name: 'その他'}
  ]
end