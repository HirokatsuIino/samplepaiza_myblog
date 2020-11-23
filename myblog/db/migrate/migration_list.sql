
-- お知らせ
-- テーブル名：notifications
-- カラム：id, title, body, begin_at, end_at
rails generate scaffold notification title:string body:string begin_at:datetime end_at:datetime
-- seed_fu
-- notifications.rb


-- 単価管理
-- テーブル名：unit_prices
-- カラム：id, relation_type_id, value, billing_code, refund_code, billing_invoice_name, refund_invoice_name, campagin_flg
rails generate scaffold unit_price relation_type_id:integer value:integer billing_code:string refund_code:string billing_invoice_name:string refund_invoice_name:string campagin_flg:boolean
-- seed_fu
-- unit_prices.rb

-- EU対応履歴
-- テーブル名：contact_histories
-- カラム：id, document_request_id, name, name_hira, email, tel, supported_at, comment, support_required_flg
rails generate scaffold contact_history document_request_id:integer name:string name_hira:string email:string tel:string supported_at:datetime comment:string support_required_flg:boolean
-- seed_fu
-- contact_histories.rb

-- マイグレーション実施
rails db:migrate

-- seed_fuでデータ投入
rails db:seed_fu FILTER=notifications
rails db:seed_fu FILTER=unit_prices
rails db:seed_fu FILTER=contact_histories


-- Doocker commands

-- 機能作成
--  お知らせ
docker-compose run web bin/rails g scaffold notification title:string body:string begin_at:datetime end_at:datetime
--  単価管理
docker-compose run web bin/rails g scaffold unit_price relation_type_id:integer value:integer billing_code:string refund_code:string billing_invoice_name:string refund_invoice_name:string campagin_flg:boolean
--  EU対応履歴
docker-compose run web bin/rails g scaffold contact_history document_request_id:integer name:string name_hira:string email:string tel:string supported_at:datetime comment:string support_required_flg:boolean

-- マイグレーション実施
docker-compose run web bin/rails db:migrate

-- seed_fuでデータ投入
docker-compose run web bin/rails db:seed_fu FILTER=notifications
docker-compose run web bin/rails db:seed_fu FILTER=unit_prices
docker-compose run web bin/rails db:seed_fu FILTER=contact_histories


