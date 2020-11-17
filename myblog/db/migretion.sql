-- Client機能
-- テーブル名：client
-- カラム：id, client_id, name, admin_comment, area_important, nav_id
rails generate scaffold client id:integer, client_id:integer, name:string, admin_comment:string, area_important:string, nav_id:integer
has_one :client_publishing_setting, foreign_key: 'client_id'
has_one :client_unit_price, foreign_key: 'client_id'
has_one :publishing_fee, foreign_key: 'client_id'


-- クライアント掲載設定
-- テーブル名：client_publishing_settings
-- カラム：id, client_id, comment
rails generate scaffold client_publishing_setting client_id:integer comment:string


rails db:migrate


-- クライアント掲載設定機能
-- テーブル名：client_unit_prices
-- カラム：id, client_id, unit_price_id, begin_at
rails generate scaffold client_unit_price client_id:integer unit_price_id:integer begin_at:date


-- 掲載料
-- テーブル名：publishing_fees
-- カラム：id, client_id, value
rails generate scaffold publishing_fee client_id:integer value:string
