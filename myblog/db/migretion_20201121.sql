
rails db:migrate


-- Client機能
-- LIFOOD48 SMS_クライアント一覧
-- LIFOOD51 SMS_クライアント_詳細
-- LIFOOD52 SMS_クライアント_編集
-- LIFOOD54 SMS_クライアント_登録
-- テーブル名：client
-- カラム：id, client_type_id, name, admin_comment, area_important, nav_id
rails generate scaffold client client_type_id:integer name:string admin_comment:string area_important:string nav_id:integer
-- seed_fu
-- client.rb
-- csv
-- client.csv

-- has_one :client_publishing_setting, foreign_key: 'client_id'
-- has_one :client_unit_price, foreign_key: 'client_id'
-- has_one :publishing_fee, foreign_key: 'client_id'
-- has_one :basic_information, foreign_key: 'client_id'
-- has_one :notification_recipient, foreign_key: 'client_id'



-- クライアント掲載設定機能
-- テーブル名：client_unit_prices
-- カラム：id, client_id, unit_price_id, begin_at
rails generate scaffold client_unit_price client_id:integer unit_price_id:integer begin_at:datetime
-- seed_fu
-- client_unit_prices.rb
-- csv
-- client_unit_prices.csv


-- 掲載料
-- テーブル名：publishing_fees
-- カラム：id, client_id, value
rails generate scaffold publishing_fee client_id:integer value:string
-- seed_fu
-- publishing_fees.rb
-- csv
-- publishing_fees.csv


-- 基本情報
-- テーブル名：basic_informations
-- カラム：id, corporate_name, address, tel, email, fax, url, client_id, oddice_id, identical_for_clientflag
rails generate scaffold basic_information corporate_name:string address:string tel:string email:string fax:string url:string client_id:integer office_id:integer identical_for_clientflag:boolean
-- seed_fu
-- basic_informations.rb
-- csv
-- basic_informations.csv


-- 通知先
-- テーブル名：notification_recipients
-- カラム：id, client_id, office_id, name, email, identical_for_clientflag
rails generate scaffold notification_recipient client_id:integer office_id:integer name:string email:string identical_for_clientflag:boolean
-- seed_fu
-- notification_recipients.rb
-- csv
-- notification_recipients.csv


-- 広告
-- テーブル名：advertisings
-- カラム：id, client_id, office_id, title, store_name, logo, image, appeal_point_1, appeal_point_2, appeal_point_3, appeal_point_4, supplement, identical_for_clientflag
rails generate scaffold advertising client_id:integer office_id:integer title:string store_name:string logo:string image:string appeal_point_1:string appeal_point_2:string appeal_point_3:string appeal_point_4:string supplement:string identical_for_clientflag:boolean
-- seed_fu
-- advertisings.rb
-- csv
-- advertisings.csv


-- 成約課金単価
-- テーブル名：contract_billing_unit_prices
-- カラム：id, client_id, value, service period type_id
rails generate scaffold contract_billing_unit_price client_id:integer value:string service_period_type_id:integer
-- seed_fu
-- contract_billing_unit_prices.rb
-- csv
-- contract_billing_unit_prices.csv


-- サービス期間種別
-- テーブル名：service_term_types
-- カラム：id, name
rails generate scaffold service_term_type name:string
-- seed_fu
-- service_term_types.rb
-- csv
-- service_term_types.csv


-- NAV用設定
-- テーブル名：nav_settings
-- カラム：id, Name, client_code, partner_code, name_for_invoice, comment
rails generate scaffold nav_setting name:string client_code:string partner_code:string name_for_invoice:string comment:string
-- seed_fu
-- nav_settings.rb
-- csv
-- nav_settings.csv


-- クライアント機能制限
-- テーブル名：client_functional_restrictions
-- カラム：id, client_id, readable_and_editable_area_set_by_office_flag, non_billing_requestable_user_category_id
rails generate scaffold client_functional_restriction client_id:integer readable_and_editable_area_set_by_office_flag:boolean non_billing_requestable_user_category_id:integer
-- seed_fu
-- client_functional_restrictions.rb
-- csv
-- client_functional_restrictions.csv


-- 非課金申請可能者カテゴリ
-- テーブル名：non_billing_requestable_user_categories
-- カラム：id, Name
rails generate scaffold non_billing_requestable_user_category name:string
-- seed_fu
-- non_billing_requestable_user_categories.rb
-- csv
-- non_billing_requestable_user_categories.csv


-- 月次予算
-- テーブル名：monthly_budgets
-- カラム：id, client_id, limit, begin_at
rails generate scaffold monthly_budget client_id:integer limit:string begin_at:datetime
-- seed_fu
-- monthly_budgets.rb
-- csv
-- monthly_budgets.csv


-- 月次送客数
-- テーブル名：monthly_number_of_customers
-- カラム：id, max, begin_at, client_id
rails generate scaffold monthly_number_of_customer limit:string begin_at:datetime client_id:integer
-- seed_fu
-- monthly_number_of_customers.rb
-- csv
-- monthly_number_of_customers.csv


-- 課金設定
-- テーブル名：billing_settings
-- カラム：id, client_id, billing_method_id, duplication_non_billing_months, comment
rails generate scaffold billing_setting client_id:integer billing_method_id:integer duplication_non_billing_months:integer comment:string
-- seed_fu
-- billing_settings.rb
-- csv
-- billing_settings.csv


-- 課金方法
-- テーブル名：billing_methods
-- カラム：id, name
rails generate scaffold billing_method name:string
-- seed_fu
-- billing_methods.rb
-- csv
-- billing_methods.csv


-- クライアント掲載設定
-- テーブル名：client_publishing_settings
-- カラム：id, client_id, comment
rails generate scaffold client_publishing_setting client_id:integer comment:string
-- seed_fu
-- client_publishing_settings.rb
-- csv
-- client_publishing_settings.csv


-- 掲載設定
-- テーブル名：publishing_terms
-- カラム：id, client_publishing_setting_id, begin_at, end_at, flg
rails generate scaffold publishing_term client_publishing_setting_id:integer begin_at:datetime end_at:datetime flg:boolean
-- seed_fu
-- publishing_terms.rb
-- csv
-- publishing_terms.csv


-- 掲載優先順位期間
-- テーブル名：publishing_priority_terms
-- カラム：id, client_publishing_setting_id, publishing_priority_id, begin_at
rails generate scaffold publishing_priority_term client_publishing_setting_id:integer publishing_priority_id:integer begin_at:datetime
-- seed_fu
-- publishing_priority_terms.rb
-- csv
-- publishing_priority_terms.csv


-- 掲載優先度
-- テーブル名：publishing_priorities
-- カラム：id, name
rails generate scaffold publishing_prioritie name:string
-- seed_fu
-- publishing_priorities.rb
-- csv
-- publishing_priorities.csv


-- 担当者一覧
-- テーブル名：partner_lists
-- カラム：id, client_id, office_id, identical_for_clientflag
rails generate scaffold partner_list client_id:integer office_id:integer identical_for_clientflag:boolean
-- seed_fu
-- partner_lists.rb
-- csv
-- partner_lists.csv


-- 担当者
-- テーブル名：partners
-- カラム：id, partners_list_id, name, title, email, tel, admin_comment
rails generate scaffold partner partners_list_id:integer name:string title:string email:string tel:string admin_comment:string
-- seed_fu
-- partners.rb
-- csv
-- partners.csv


-- サービス一覧
-- テーブル名：service_catalogs
-- カラム：id, client_id, office_id, identical_for_clientflag, tasting_flag, safety_confirmation_flag
rails generate scaffold service_catalog client_id:integer office_id:integer identical_for_clientflag:boolean tasting_flag:boolean safety_confirmation_flag:string
-- seed_fu
-- service_catalogs.rb
-- csv
-- service_catalogs.csv


-- サービス一覧_温度帯
-- テーブル名：service_catalog_temperature_zones
-- カラム：id, service_catalog_id, temperature_id
rails generate scaffold service_catalog_temperature_zone service_catalog_id:integer temperature_id:integer
-- seed_fu
-- service_catalog_temperature_zones.rb
-- csv
-- service_catalog_temperature_zones.csv


-- 温度帯
-- テーブル名：temperature_zones
-- カラム：id, Name
rails generate scaffold temperature_zone name:string
-- seed_fu
-- temperature_zones.rb
-- csv
-- temperature_zones.csv


-- その他付帯サービス
-- テーブル名：other_incidental_services
-- カラム：id, name
rails generate scaffold other_incidental_service name:string
-- seed_fu
-- other_incidental_services.rb
-- csv
-- other_incidental_services.csv


-- サービス一覧_その他付帯サービス
-- テーブル名：service_catalog_other_incidental_services
-- カラム：id, service_catalog_id, other_incidental_service_id
rails generate scaffold other_incidental_service service_catalog_id:integer other_incidental_service_id:integer
-- seed_fu
-- service_catalog_other_incidental_services.rb
-- csv
-- service_catalog_other_incidental_services.csv


-- 監修者
-- テーブル名：supervisors
-- カラム：id, name
rails generate scaffold supervisor name:string
-- seed_fu
-- supervisors.rb
-- csv
-- supervisors.csv


-- サービス一覧_監修者
-- テーブル名：service_catalog_supervisors
-- カラム：id, service_catalog_id, supervisor_id
rails generate scaffold service_catalog_supervisor service_catalog_id:integer supervisor_id:integer
-- seed_fu
-- service_catalog_supervisors.rb
-- csv
-- service_catalog_supervisors.csv


-- 注文単位
-- テーブル名：order_unit_categories
-- カラム：id, name
rails generate scaffold order_unit_category name:string
-- seed_fu
-- order_unit_categories.rb
-- csv
-- order_unit_categories.csv


-- サービス一覧_注文単位
-- テーブル名：service_catalog_order_unit_categories
-- カラム：id, service_catalog_id, order_unit_id
rails generate scaffold service_catalog_order_unit_category service_catalog_id:integer order_unit_id:integer
-- seed_fu
-- service_catalog_order_unit_categories.rb
-- csv
-- service_catalog_order_unit_categories.csv


-- 食事時間帯
-- テーブル名：meal_type_categories
-- カラム：id, name
rails generate scaffold meal_type_category name:string
-- seed_fu
-- meal_type_categories.rb
-- csv
-- meal_type_categories.csv


-- サービス一覧_食事時間帯
-- テーブル名：service_catalog_meal_type_categories
-- カラム：id, service_catalog_id, meal_time_id
rails generate scaffold service_catalog_meal_type_category service_catalog_id:integer meal_time_id:integer
-- seed_fu
-- service_catalog_meal_type_categories.rb
-- csv
-- service_catalog_meal_type_categories.csv


-- 注文方法
-- テーブル名：order_methods
-- カラム：id, name
rails generate scaffold order_method name:string
-- seed_fu
-- order_methods.rb
-- csv
-- order_methods.csv


-- サービス一覧_注文方法
-- テーブル名：service_catalog_order_methods
-- カラム：id, service_catalog_id, order_method_id
rails generate scaffold service_catalog_order_method service_catalog_id:integer order_method_id:integer
-- seed_fu
-- service_catalog_order_methods.rb
-- csv
-- service_catalog_order_methods.csv


-- 配送方法
-- テーブル名：shipping_methods
-- カラム：id, name
rails generate scaffold shipping_method name:string
-- seed_fu
-- shipping_methods.rb
-- csv
-- shipping_methods.csv

-- サービス一覧_配送方法
-- テーブル名：service_catalog_shipping_methods
-- カラム：id, service_catalog_id, shipping_method_id
rails generate scaffold service_catalog_shipping_method service_catalog_id:integer shipping_method_id:integer
-- seed_fu
-- service_catalog_shipping_methods.rb
-- csv
-- service_catalog_shipping_methods.csv


-- 支払い方法
-- テーブル名：payment_methods
-- カラム：id, name
rails generate scaffold payment_method name:string
-- seed_fu
-- payment_methods.rb
-- csv
-- payment_methods.csv


-- サービス一覧_支払い方法
-- テーブル名：service_catalog_payment_methods
-- カラム：id, service_catalog_id, payment_method_id
rails generate scaffold service_catalog_payment_method service_catalog_id:integer payment_method_id:integer
-- seed_fu
-- service_catalog_payment_methods.rb
-- csv
-- service_catalog_payment_methods.csv


-- 食事種類
-- テーブル名：meal_types
-- カラム：id, name
rails generate scaffold meal_type name:string
-- seed_fu
-- meal_types.rb
-- csv
-- meal_types.csv


-- サービス一覧_食事種類
-- テーブル名：service_catalog_meal_types
-- カラム：id, service_catalog_id, meal_type_id
rails generate scaffold service_catalog_meal_type service_catalog_id:integer meal_type_id:integer
-- seed_fu
-- service_catalog_meal_types.rb
-- csv
-- service_catalog_meal_types.csv


-- 事業所
-- テーブル名：offices
-- カラム：id, client_id, name, cl_defied_code, comment, unpublishing_at
rails generate scaffold office client_id:integer, name:string, cl_defied_code:string, comment:string, unpublishing_at:datetime
-- seed_fu
-- offices.rb
-- csv
-- offices.csv


-- 事業所特有項目
-- テーブル名：office_unique_items
-- カラム：id,office_id, sl_fureai_flag
rails generate scaffold office_unique_item office_id:integer sl_fureai_flag:boolean
-- seed_fu
-- office_unique_items.rb
-- csv
-- office_unique_items.csv


-- キャンペーン期間
-- テーブル名：trial_terms
-- カラム：id, office_id, begin_at, end_at
rails generate scaffold trial_term office_id:integer begin_at:datetime end_at:datetime
-- seed_fu
-- trial_terms.rb
-- csv
-- trial_terms.csv



-- サンクスページ設定
-- テーブル名：thanks_page_settings
-- カラム：id, client_id, office_id, document_pdf, tel, url, identical_for_clientflag, thanks_action_id, order_page_url, comment, business_hour, holiday, shortest_use_start_day
rails generate scaffold thanks_page_setting client_id:integer office_id:integer document_pdf:string tel:string url:string identical_for_clientflag:boolean thanks_action_id:integer order_page_url:string comment:string business_hour:string holiday:string shortest_use_start_day:string
-- seed_fu
-- thanks_page_settings.rb
-- csv
-- thanks_page_settings.csv


-- サンクスページアクションボタン
-- テーブル名：thanks_page_action_buttons
-- カラム：id, title, url
rails generate scaffold thanks_page_action_button title:string url:string
-- seed_fu
-- thanks_page_action_buttons.rb
-- csv
-- thanks_page_action_buttons.csv













-- リレーション
-- client.id 1:N publishing_fees.client_id
--
-- client.id 1:N client_unit_prices.client_id
-- client_unit_prices.unit_price_id N:1 unit_prices.id
--
-- client.id 1:N contract_billing_unit_prices.client_id
-- contract_billing_unit_prices.service_period_type_id 1:1 service_term_types.id
--
-- client.id 1:N monthly_number_of_customers.client_id
--
-- client.id 1:N monthly_budgets.client_id
--
-- client.id 1:N client_publishing_settings.client_id
-- client_publishing_settings.id 1:N publishing_terms.client_publishing_setting_id
--
-- client_publishing_settings.id 1:N publishing_priority_terms.client_publishing_setting_id
-- publishing_priority_terms.publishing_priority_id 1:1 publishing_priorities.id
--
-- client.nav_id 1:1 nav_settings.id
--
--
-- client.id 1:1 billing_settings.client_id
-- billing_settings.billing_method_id 1:1 billing_method.id
--
--
-- client.id 1:1 client_functional_restrictions.client_id
-- client_functional_restrictions.non_billing_requestable_user_category_id 1:1 non_billing_requestable_user_categories.id
--
-- client.id 1:N offices.client_id
--
-- client.id 1:1 basic_informations.client_id
-- basic_informations.office_id 1:1 offices.id
--
-- client.id 1:N notification_recipients.client_id
-- notification_recipients.office_id 1:N offices.id
--
-- client.id 1:1 advertisings.client_id
-- advertisings.office_id 1:1 offices.id
--
-- client.id 1:1 thanks_page_settings.client_id
-- thanks_page_settings.office_id 1:1 offices.id
-- thanks_page_settings.thanks_action_id 1:1 thanks_page_action_buttons.id
-- thanks_page_action_buttons.id 1:1 orders.pushed_thanks_page_action_button_id
--
--
-- client.id 1:1 service_catalogs.client_id
-- service_catalogs.office_id 1:1 offices.id
--
-- client.id 1:1 partners_list.client_id
-- offices.id 1:1 partners_list.office_id
-- partners_list.id 1:N partners.partners_list_id
--






-- [FIXED]お知らせ OK
-- LIFOOD233 運営_お知らせ_一覧
-- LIFOOD234 運営_お知らせ_詳細
-- LIFOOD235 運営_お知らせ_編集
-- LIFOOD236 運営_お知らせ_登録
-- テーブル名：notifications
-- カラム：id, title, body, begin_at, end_at
rails generate scaffold notification title:string body:string begin_at:datetime end_at:datetime
-- seed_fu
-- notifications.rb
-- csv
-- notifications.csv



-- ユーザー
-- LIFOOD63 SMS_CLユーザー一覧
-- LIFOOD64 SMS_CLユーザー_詳細
-- LIFOOD65 SMS_CLユーザー_編集
-- LIFOOD66 SMS_CLユーザー_登録
--  テーブル名：users
-- カラム：id, email, password, last_name, first_name, last_name_kana, first_name_kana
rails generate scaffold user email:string password:string last_name:string first_name:string last_name_kana:string first_name_kana:string
-- seed_fu
-- users.rb
-- csv
-- users.csv


-- 役割
-- テーブル名：roles
-- カラム：id, name
rails generate scaffold role name:string
-- seed_fu
-- roles.rb
-- csv
-- roles.csv


-- ユーザー_役割
-- テーブル名：users_roles
-- カラム：id, user_id, role_id
rails generate scaffold users_role user_id:integer role_id:integer
-- seed_fu
-- users_roles.rb
-- csv
-- users_roles.csv


-- 事業所_ユーザー
-- テーブル名：offises_users
-- カラム：id, office_id, user_id
rails generate scaffold offises_user office_id:integer user_id:integer
-- seed_fu
-- offises_users.rb
-- csv
-- offises_users.csv



-- リレーション
-- users.id 1:1 offises_users.user_id
-- users.id 1:N users_roles.user_id
-- users_roles.role_id 1:1 roles.id
-- offices.id 1:N offises_users.office_id






-- 管理者
-- テーブル名：admins
-- カラム：id, email, password, last_name, first_name, last_name_kana, first_name_kana
rails generate scaffold admin email:string password:string last_name:string first_name:string last_name_kana:string first_name_kana:string
-- seed_fu
-- admins.rb
-- csv
-- admins.csv


-- 非課金申請理由
-- テーブル名：non_billing_request_reasons
-- カラム：id,name
rails generate scaffold non_billing_request_reason name:string
-- seed_fu
-- non_billing_request_reasons.rb
-- csv
-- non_billing_request_reasons.csv


-- 非課金申請
-- テーブル名：non_billing_requests
-- カラム：id, order_id, non_billing_request_reason_id, request_reason_detail, first_contacted_at, second_contacted_at, third_contacted_at, begin_at, admin_sms_comment, judge_admin_id, approval_at, denial_at, relation_type_change_date_at, judge_reason_for_user, admin_comment
rails generate scaffold non_billing_request order_id:integer non_billing_request_reason_id:integer request_reason_detail:string first_contacted_at:datetime second_contacted_at:datetime third_contacted_at:datetime begin_at:datetime admin_sms_comment:string judge_admin_id:integer approval_at:datetime denial_at:datetime relation_type_change_date_at:datetime judge_reason_for_user:string admin_comment:string
-- seed_fu
-- non_billing_requests.rb
-- csv
-- non_billing_requests.csv


-- 重複受注
-- テーブル名：duplicate_orders
-- カラム：id, non_billing_request_id, order_id
rails generate scaffold duplicate_order non_billing_request_id:integer order_id:integer
-- seed_fu
-- duplicate_orders.rb
-- csv
-- duplicate_orders.csv



-- 非課金申請調査履歴
-- テーブル名：non_billing_request_investigation_histories
-- カラム：id, non_billing_request_id, investigated_at, investigated_comment, investigated_id
rails generate scaffold non_billing_request_investigation_history non_billing_request_id:integer, investigated_at:datetime, investigated_comment:string, investigated_id:integer
-- seed_fu
-- non_billing_request_investigation_histories.rb
-- csv
-- non_billing_request_investigation_histories.csv


-- 非課金申請エビデンス
-- テーブル名：non_billing_request_evidences
-- カラム：id,non_billing_request_id, file
rails generate scaffold non_billing_request_evidence non_billing_request_id:integer file:string
-- seed_fu
-- non_billing_request_evidences.rb
-- csv
-- non_billing_request_evidences.csv


-- 受注時請求対象外理由
-- テーブル名：initial_billing_ignore_reasons
-- カラム：id,name
rails generate scaffold initial_billing_ignore_reason name:string
-- seed_fu
-- initial_billing_ignore_reasons.rb
-- csv
-- initial_billing_ignore_reasons.csv


-- 受注
-- テーブル名：orders
-- カラム：id, document_request_id, office_id, request_unit_price, unit_price_id, unit_price_relation_type_id, pushed_thanks_page_action_button_id, order_request_no_applicate_flg, order_request_no_applicate_reson_id
rails generate scaffold orders document_request_id:integer office_id:integer request_unit_price:integer unit_price_id:integer unit_price_relation_type_id:integer pushed_thanks_page_action_button_id:integer order_request_no_applicate_flg:boolean order_request_no_applicate_reson_id:integer
-- seed_fu
-- orders.rb
-- csv
-- orders.csv


-- [FIXED]単価管理
-- LIFOOD205 運営_単価管理_一覧
-- LIFOOD206 運営_単価管理_詳細
-- LIFOOD207 運営_単価管理_編集
-- LIFOOD208 運営_単価管理_登録
-- テーブル名：unit_prices
-- カラム：id, value, billing_code, refund_code, billing_invoice_name, refund_invoice_name, campagin_flg
rails generate scaffold unit_price value:integer billing_code:string refund_code:string billing_invoice_name:string refund_invoice_name:string campagin_flg:boolean
-- seed_fu
-- unit_prices.rb
-- csv
-- unit_prices.csv


-- 関係
-- テーブル名：relationships
-- カラム：id, relationship_type_name, relationship_id
rails generate scaffold relationship relationship_type_name:string, relationship_id:integer
-- seed_fu
-- relationships.rb
-- csv
-- relationships.csv


-- 関係種別
-- テーブル名：relationship_types
-- カラム：id, relationship_name,
rails generate scaffold relationship_type relationship_type_name:string
-- seed_fu
-- relationship_types.rb
-- csv
-- relationship_types.csv


-- 要注意EU
-- LIFOOD205 運営_接触禁止リスト_一覧
-- LIFOOD206 運営_接触禁止リスト_詳細
-- LIFOOD207 運営_接触禁止リスト_編集
-- LIFOOD208 運営_接触禁止リスト_登録
-- テーブル名：suspicious_end_users
-- カラム：id, document_request_id, unknown_tel, unknown_email, call_prohibited_flg, mail_prohibited_flg, careful_eu_reson_id
rails generate scaffold suspicious_end_user document_request_id:integer unknown_tel:string unknown_email:string call_prohibited_flg:boolean mail_prohibited_flg:boolean careful_eu_reson_id:integer
-- seed_fu
-- suspicious_end_users.rb
-- csv
-- suspicious_end_users.csv


-- 要注意EU理由
-- LIFOOD206 運営_接触禁止リスト_詳細
-- LIFOOD207 運営_接触禁止リスト_編集
-- LIFOOD208 運営_接触禁止リスト_登録
-- テーブル名：suspicious_end_user_reasons
-- カラム：id, suspicious_end_user_reason_comment
rails generate scaffold suspicious_end_user_reason suspicious_end_user_reason_comment:string
-- seed_fu
-- suspicious_end_user_reasons.rb
-- csv
-- suspicious_end_user_reasons.csv


-- 資料請求
-- テーブル名：document_requests
-- カラム：id, name, name_hira, tel, email, post_code, prefectures_id, municipality_id, remaining_address, person_eat_id, order_plan_category_id, tel_other, scd_site_code, access_at, devise, scd_site_lp, form, admin_comment, area_code_id
rails generate scaffold document_request name:string name_hira:string tel:string email:string post_code:string prefectures_id:integer municipality_id:integer remaining_address:string person_eat_id:integer order_plan_category_id:integer tel_other:string scd_site_code:string access_at:datetime, devise:string, scd_site_lp:string, form:string, admin_comment:string, area_code_id:integer
-- seed_fu
-- document_requests.rb
-- csv
-- document_requests.csv


-- 資料請求_食事種類
-- テーブル名：document_request_meal_types
-- カラム：id, document_request_id, meal_type_id
rails generate scaffold document_request_meal_type document_request_id:integer meal_type_id:integer
-- seed_fu
-- document_request_meal_type.rb
-- csv
-- document_request_meal_type.csv


-- 注文予定日カテゴリ
-- テーブル名：expected_order_date_categories
-- カラム：id, expected_order_date_category_name
rails generate scaffold expected_order_date_category expected_order_date_category_name:string
-- seed_fu
-- expected_order_date_categories.rb
-- csv
-- expected_order_date_categories.csv


-- EU対応履歴
-- テーブル名：contact_histories
-- カラム：id, document_request_id, name, name_hira, email, tel, supported_at, comment, support_required_flg
rails generate scaffold contact_history document_request_id:integer name:string name_hira:string email:string tel:string supported_at:datetime comment:string support_required_flg:boolean
-- seed_fu
-- contact_histories.rb
-- csv
-- contact_histories.csv





-- エリアセット_エリアコード
-- テーブル名：area_sets_area_codes
-- カラム：id, area_set_id, area_code_id
rails generate scaffold area_sets_area_code area_set_id:integer area_code_id:integer


-- エリアセット
-- テーブル名：area_sets
-- カラム：id, office_id, name
rails generate scaffold area_set office_id:integer name:string


-- エリアセット掲載設定
-- テーブル名：area_set_publishing_settings
-- カラム：id, office_id, area_set_id, meal_type_id, begin_at, end_at, reside_flg
rails generate scaffold area_set_publishing_setting office_id:integer area_set_id:integer meal_type_id:integer begin_at:datetime end_at:datetime reside_flg:boolean








-- リレーション
-- suspicious_end_user.careful_eu_reson_id 1:1 suspicious_end_user_reason.id








-- // [TODO] 20201121 見直し中 -S
-- // 郵便番号と都道府県は、リレーションを張った方が良いのではないか？
-- エリアコード
-- テーブル名：area_codes
-- カラム：id, prefecture_id, municipality_id, town_name_id, character_name_id, town_name_code, new_town_name_code, postal_code_count, government_designated_city_flg, foreign_words_in_prefecture_flg, foreign_words_in_municipality_flg, foreign_words_in_large_village_section_flg, foreign_words_in_village_section_flg, registered_at, abolished_at, name_changed_at, postal_code_changed_at, house_display_implementation_at, house_display_implementation_flg, common_name_flg, street_name_flg, large_village_section_flg_1, large_village_section_flg_2, old_postal_code, fixed_code
rails generate scaffold area_code prefecture_id:integer municipality_id:integer town_name_id:integer character_name_id:integer town_name_code:string new_town_name_code:string postal_code_count:integer government_designated_city_flg:boolean foreign_words_in_prefecture_flg:boolean foreign_words_in_municipality_flg:boolean foreign_words_in_large_village_section_flg:boolean foreign_words_in_village_section_flg:boolean registered_at:datetime abolished_at:datetime name_changed_at:datetime postal_code_changed_at:datetime house_display_implementation_at:datetime house_display_implementation_flg:boolean common_name_flg:boolean street_name_flg:boolean large_village_section_flg_1:boolean large_village_section_flg_2:boolean old_postal_code:string fixed_code:string


-- 都道府県
-- テーブル名：prefectures
-- カラム：id, prefecture_code, name, name_kana
rails generate scaffold prefecture post_id:integer name:string name_kana:string


-- 市区群町村
-- テーブル名：municipalities
-- カラム：id, prefecture_id, municipalitie_code, name, name_kana
rails generate scaffold municipalitie prefecture_id:integer municipalitie_code:string name:string name_kana:string


-- 大字・町名
-- テーブル名：town_names
-- カラム：id, municipality_id, town_name, town_name_kana
rails generate scaffold town_name municipality_id:integer town_name:string town_name_kana:string


-- 字名・丁目
-- テーブル名：character_names
-- カラム：id, character_name_id, character_name, character_name_kana
rails generate scaffold character_name character_name_id:integer character_name:string character_name_kana:string


-- エリアコード_郵便番号
-- テーブル名：area_codes_post_codes
-- カラム：id, area_code_id, post_code_id
rails generate scaffold area_codes_post_code area_code_id:integer post_code_id:integer


-- 郵便番号
-- テーブル名：post_codes
-- カラム：id, post_code
rails generate scaffold post_code post_code:string

-- // [TODO] 20201121 見直し中 -E





service_catalogs.id 1:N service_catalog_temperature_zones.service_catalog_id
service_catalog_temperature_zones.temperature_id 1:1 temperature_zones.id

service_catalogs.id 1:N service_catalog_other_incidental_services.service_catalog_id
service_catalog_other_incidental_services.other_incidental_service_id 1:1 other_incidental_services.id

service_catalogs.id 1:N service_catalog_supervisors.service_catalog_id
service_catalog_supervisors.supervisor_id 1:1 supervisors.id

service_catalogs.id 1:N service_catalog_order_unit_categories.service_catalog_id
service_catalog_order_unit_categories.order_unit_id 1:1 order_unit_categories.id

service_catalogs.id 1:N service_catalog_meal_type_categories.service_catalog_id
service_catalog_meal_type_categories.meal_time_id 1:1 meal_type_categories.id

service_catalogs.id 1:N service_catalog_order_methods.service_catalog_id
service_catalog_order_methods.order_method_id 1:1 order_methods.id

service_catalogs.id 1:N service_catalog_shipping_methods.service_catalog_id
service_catalog_shipping_methods.shipping_method_id 1:1 shipping_methods.id

service_catalogs.id 1:N service_catalog_payment_methods.service_catalog_id
service_catalog_payment_methods.payment_method_id 1:1 payment_methods.id

service_catalogs.id 1:N service_catalog_meal_types.service_catalog_id
service_catalog_meal_types.meal_type_id 1:1 meal_types.id



orders.id 1:1 duplicate_orders.order_id
orders.id 1:1 non_billing_requests.order_id
duplicate_orders.non_billing_request_id N:1 non_billing_requests.id
non_billing_requests.id 1:N non_billing_request_investigation_histories.non_billing_request_id
non_billing_requests.judge_admin_id 1:1 admins.id
non_billing_request_investigation_histories.investigated_id 1:1 admins.judge_admin_id


non_billing_requests.non_billing_request_reason_id 1:1 non_billing_request_reasons.id
non_billing_requests.id 1:N non_billing_request_evidences.non_billing_request_id

orders.order_request_no_applicate_reson_id 1:1 initial_billing_ignore_reasons.id

orders.unit_price_id 1:1 unit_prices.id
unit_prices.relation_type_id 1:1 relationship_types.id
relationship_types.id 1:1 relationships.relationship_id
relationships.relationship_id 1:1 document_requests.person_eat_id



orders.document_request_id N:1 document_requests.id
document_requests.id 1:N document_request_meal_types.document_request_id
document_request_meal_types.meal_type_id 1:1 meal_types.id

offices.id 1:N area_set_publishing_settings.office_id
area_set_publishing_settings.meal_type_id 1:1 meal_types.id

area_set_publishing_settings.area_set_id N:1 area_sets.id
offices.id 1:N area_set_id.office_id

area_sets.id 1:N area_sets_area_codes.area_set_id


offices.id 1:N trial_terms.office_id
offices.id 1:N office_unique_items.office_id

offices.id 1:1 orders.office_id

area_codes.id 1:N area_sets_area_codes.area_set_id


area_codes.prefecture_id N:1 prefectures.id
prefectures.id 1:N municipalities.prefecture_id
prefectures.id 1:1 document_requests.prefectures_id

area_codes.municipality_id N:1 municipalities.id
municipalities.id 1:1 document_requests.municipality_id

municipalities.id 1:N town_names.municipality_id

area_codes.town_name_id N:1 town_names.id
town_names.id 1:N character_names.character_name_id
area_codes.character_name_id N:1 character_names.id


area_codes.id 1:N area_codes_postal_codes.area_code_id
area_codes_postal_codes.postal_code_id N:1 postal_codes.id

area_codes.id 1:1 document_requests.area_code_id


document_requests.order_plan_category_id 1:1 expected_order_date_categories.id
document_requests.id 1:N contact_histories.document_request_id

document_requests.id 1:N suspicious_end_users.document_request_id
suspicious_end_users.careful_eu_reson_id 1:1 suspicious_end_user_reasons.id




