# 〜〜〜〜〜パンくず親〜〜〜〜〜
crumb :root do
  link "メルカリ", root_path, class:'bread-home-btn'
end

# 〜〜〜〜〜パンくず子供エリア〜〜〜〜〜

# マイページ
crumb :mypage do
  link "マイページ", mypage_path
end

# ログアウト
crumb :logout do 
  link "ログアウト", mypage_logout_path
  parent :mypage
end

# プロフィール
crumb :profile do 
  link "プロフィール", mypage_edit_profile_path
  parent :mypage
end


# 出品した商品-出品中
crumb :put_up_goods_on_sale do 
  link "出品した商品-出品中", mypage_put_up_goods_on_sale_path
  parent :mypage
end

# 購入した商品-取引中
crumb :purchased_on_deal do 
  link "購入した商品-取引中",  mypage_purchased_on_deal_path
  parent :mypage
end

# 支払い方法
crumb :credit_enter do 
  link "支払い方法",    mypage_credit_enter_path
  parent :mypage
end

# 本人情報の登録
crumb :make_sure_user do 
  link "本人情報の登録", mypage_make_sure_user_info_path
  parent :mypage
end

# 〜〜〜〜〜パンくず孫エリア〜〜〜〜〜

# クレジットカード情報入力
crumb :credit_register do 
  link "クレジットカード情報入力", mypage_credit_register_path 
  parent :credit_enter
end

# 〜〜〜〜〜以下：パンくずの考え方と作り方 9/28 YS〜〜〜〜〜

# カテゴリー＞メンズ＞トップス＞ライダースと表示させてみる場合には
# 以下：親パン カテゴリー
# crumb :category do
#   link "カテゴリー＾", root_path, 
# end

# 以下：子供パン メンズ
# crumb :mens do 
#   link "メンズ", mens_path # ←ここのパスはPrefixの値を入れてあげよう ターミナルでrake routesで確認ができる
# end

# 以下：孫パン トップス
# crumb :tops do 
#   link "トップス", tops_path
#   parent :mens # ←ここで初めてparentを使いその上の階層（ここで言うmens）を指定してあげる。
# end

# 以下：ひ孫パン ライダース
# crumb :riders do 
#   link "ライダース", riders_path
#   parent :tops # ←これ以降はどんどん上の階層に紐づかせていく事でどんどん数珠繋ぎになっていく。
# end

# あとは反映させたいページに合わせて入れてあげよう、
# 例えばライダースのカテゴリーが出てくるビューページ(htmlかhaml)に表示させたい箇所に入れてあげればOK

# - breadcrumb :riders ←これが呼び出す為のメソッド名になる。
# = breadcrumbs separator: "&rsaquo; ", class: "breadcrumbs-list"


# 〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).