#送料込みブロック
#送料込みの子カテゴリー配列
postageincluded_child_array = ['らくらくメルカリ便','ゆうゆうメルカリ便','大型らくらくメルカリ便','未定','ゆうメール','レターパック','普通郵便(定型、定型外)','クロネコヤマト','ゆうパック','クリックポスト','ゆうパケット']

parent = Delivery.create(delivery_method: '送料込み(出品者負担)')
postageincluded_child_array.each_with_index do |child|
 child = parent.children.create(delivery_method: child)
end

#着払いブロック
#着払いの子カテゴリー配列
cashondelivery_child_array = ['未定', 'クロネコヤマト', 'ゆうパック', 'ゆうメール']

parent = Delivery.create(delivery_method: '着払い(購入者負担)')
cashondelivery_child_array.each_with_index do |child|
  child = parent.children.create(delivery_method: child)
end