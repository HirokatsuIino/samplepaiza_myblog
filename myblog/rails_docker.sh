#!/usr/bin/env bash
# docker-compose run web bin/rails g scaffold
# docker-compose run web bin/rails db:migrate
# clients
docker-compose run web bin/rails g scaffold client name:string admin_comment:string area_important:string nav_id:integer
#docker-compose run web bin/rails db:migrate

# offices
docker-compose run web bin/rails g scaffold office client_id:integer name:string cl_defied_ofice_code:string comment:string unpublishing_at:datetime
#docker-compose run web bin/rails db:migrate

#-- クライアント掲載設定機能 client_publishing_settings
docker-compose run web bin/rails g scaffold client_publishing_setting client_id:integer comment:string
#docker-compose run web bin/rails db:migrate

#-- クライアント掲載設定機能 client_unit_prices
docker-compose run web bin/rails g scaffold client_unit_price client_id:integer unit_price_id:integer begin_at:datetime
#docker-compose run web bin/rails db:migrate

#-- 月額基本掲載料 publishing_fees
docker-compose run web bin/rails g scaffold publishing_fee client_id:integer value:string monthly_basic_publication_fee_product_code:string monthly_basic_publication_fee_invoice_display_name:string
#docker-compose run web bin/rails db:migrate

#-- 基本情報 basic_informations
docker-compose run web bin/rails g scaffold basic_information corporate_name:string address:string tel:string email:string fax:string url:string client_id:integer office_id:integer identical_for_clientflag:boolean
docker-compose run web bin/rails db:migrate

#-- 通知先 notification_recipients
docker-compose run web bin/rails g scaffold notification_recipient client_id:integer office_id:integer name_emails_id:integer identical_for_clientflag:boolean
docker-compose run web bin/rails db:migrate

#-- 通知 name_emails
docker-compose run web bin/rails g scaffold name_email name:string email:string
docker-compose run web bin/rails db:migrate

#-- 広告 advertisings
docker-compose run web bin/rails g scaffold advertising client_id:integer office_id:integer title:string store_name:string logo:string image:string appeal_point_1:string appeal_point_2:string appeal_point_3:string appeal_point_4:string supplement:string identical_for_clientflag:boolean
docker-compose run web bin/rails db:migrate

#-- 成約課金単価 contract_billing_unit_prices
docker-compose run web bin/rails g scaffold contract_billing_unit_price client_id:integer contract_billing_product_code:string contract_billing_invoice_display_name:string value:string service_period_type_id:integer
docker-compose run web bin/rails db:migrate

#-- サービス期間種別 service_term_types
docker-compose run web bin/rails g scaffold service_term_type name:string
docker-compose run web bin/rails db:migrate

#-- NAV用設定 nav_settings
docker-compose run web bin/rails g scaffold nav_setting name:string client_code:string partner_code:string name_for_invoice:string comment:string
docker-compose run web bin/rails db:migrate

#-- クライアント機能制限 client_functional_restrictions
docker-compose run web bin/rails g scaffold client_functional_restriction client_id:integer cannot_see_and_edit_publishing_and_area_set_flag:boolean non_billing_requestable_user_category_id:integer
docker-compose run web bin/rails db:migrate

#-- 非課金申請可能者カテゴリ non_billing_requestable_user_categories
docker-compose run web bin/rails g scaffold non_billing_requestable_user_category name:string
docker-compose run web bin/rails db:migrate

#-- 月次予算 monthly_budgets
docker-compose run web bin/rails g scaffold monthly_budget client_id:integer limit:string begin_at:datetime
docker-compose run web bin/rails db:migrate

#-- 月次送客数 monthly_number_of_customers
docker-compose run web bin/rails g scaffold monthly_number_of_customer limit:string begin_at:datetime client_id:integer
docker-compose run web bin/rails db:migrate

#-- 課金設定 billing_settings
docker-compose run web bin/rails g scaffold billing_setting client_id:integer billing_method_id:integer duplication_non_billing_months:integer comment:string
docker-compose run web bin/rails db:migrate

#-- 課金方法 billing_methods
docker-compose run web bin/rails g scaffold billing_method name:string
docker-compose run web bin/rails db:migrate

#-- 掲載設定 publishing_terms
docker-compose run web bin/rails g scaffold publishing_term client_publishing_setting_id:integer begin_at:datetime end_at:datetime flg:boolean
#docker-compose run web bin/rails db:migrate

#-- 掲載優先順位期間 publishing_priority_terms
docker-compose run web bin/rails g scaffold publishing_priority_term client_publishing_setting_id:integer publishing_priority_id:integer begin_at:datetime
#docker-compose run web bin/rails db:migrate

#-- 掲載優先度 publishing_priorities
docker-compose run web bin/rails g scaffold publishing_prioritie name:string
docker-compose run web bin/rails db:migrate

#-- 担当者一覧 partner_lists
docker-compose run web bin/rails g scaffold partner_list client_id:integer office_id:integer identical_for_clientflag:boolean
docker-compose run web bin/rails db:migrate

#-- 担当者 partners
docker-compose run web bin/rails g scaffold partner partners_list_id:integer name:string title:string email:string tel:string admin_comment:string
docker-compose run web bin/rails db:migrate

#-- サービス一覧 service_catalogs
docker-compose run web bin/rails g scaffold service_catalog client_id:integer office_id:integer identical_for_clientflag:boolean tasting_flag:boolean safety_confirmation_flag:string
docker-compose run web bin/rails db:migrate

#-- サービス一覧_温度帯 service_catalog_temperature_zones
docker-compose run web bin/rails g scaffold service_catalog_temperature_zone service_catalog_id:integer temperature_id:integer
docker-compose run web bin/rails db:migrate

#-- 温度帯 temperature_zones
docker-compose run web bin/rails g scaffold temperature_zone name:string
docker-compose run web bin/rails db:migrate

#-- その他付帯サービス other_incidental_services
docker-compose run web bin/rails g scaffold other_incidental_service name:string
docker-compose run web bin/rails db:migrate

#-- サービス一覧_その他付帯サービス service_catalog_other_incidental_services
docker-compose run web bin/rails g scaffold other_incidental_service service_catalog_id:integer other_incidental_service_id:integer
docker-compose run web bin/rails db:migrate

#-- 監修者 supervisors
docker-compose run web bin/rails g scaffold supervisor name:string
docker-compose run web bin/rails db:migrate

#-- サービス一覧_監修者 service_catalog_supervisors
docker-compose run web bin/rails g scaffold service_catalog_supervisor service_catalog_id:integer supervisor_id:integer
docker-compose run web bin/rails db:migrate

#-- 注文単位 order_unit_categories
docker-compose run web bin/rails g scaffold order_unit_category name:string
docker-compose run web bin/rails db:migrate

#-- サービス一覧_注文単位 service_catalog_order_unit_categories
docker-compose run web bin/rails g scaffold service_catalog_order_unit_category service_catalog_id:integer order_unit_id:integer
docker-compose run web bin/rails db:migrate

#-- 食事時間帯 meal_type_categories
docker-compose run web bin/rails g scaffold meal_type_category name:string
docker-compose run web bin/rails db:migrate

#-- サービス一覧_食事時間帯 service_catalog_meal_type_categories
docker-compose run web bin/rails g scaffold service_catalog_meal_type_category service_catalog_id:integer meal_time_id:integer
docker-compose run web bin/rails db:migrate

#-- 注文方法 order_methods
docker-compose run web bin/rails g scaffold order_method name:string
docker-compose run web bin/rails db:migrate

#-- サービス一覧_注文方法 service_catalog_order_methods
docker-compose run web bin/rails g scaffold service_catalog_order_method service_catalog_id:integer order_method_id:integer
docker-compose run web bin/rails db:migrate

#-- 配送方法 shipping_methods
docker-compose run web bin/rails g scaffold shipping_method name:string
docker-compose run web bin/rails db:migrate

#-- サービス一覧_配送方法 service_catalog_shipping_methods
docker-compose run web bin/rails g scaffold service_catalog_shipping_method service_catalog_id:integer shipping_method_id:integer
docker-compose run web bin/rails db:migrate

#-- 支払い方法 payment_methods
docker-compose run web bin/rails g scaffold payment_method name:string
docker-compose run web bin/rails db:migrate

#-- サービス一覧_支払い方法 service_catalog_payment_methods
docker-compose run web bin/rails g scaffold service_catalog_payment_method service_catalog_id:integer payment_method_id:integer
docker-compose run web bin/rails db:migrate

#-- 食事種類 meal_types
docker-compose run web bin/rails g scaffold meal_type name:string
docker-compose run web bin/rails db:migrate

#-- サービス一覧_食事種類 service_catalog_meal_types
docker-compose run web bin/rails g scaffold service_catalog_meal_type service_catalog_id:integer meal_type_id:integer
docker-compose run web bin/rails db:migrate

#-- 事業所特有項目 office_unique_items
docker-compose run web bin/rails g scaffold office_unique_item office_id:integer sl_fureai_flag:boolean
docker-compose run web bin/rails db:migrate

#-- キャンペーン期間 trial_terms
docker-compose run web bin/rails g scaffold trial_term office_id:integer begin_at:datetime end_at:datetime
docker-compose run web bin/rails db:migrate

#-- サンクスページ設定 thanks_page_settings
docker-compose run web bin/rails g scaffold thanks_page_setting client_id:integer office_id:integer document_pdf:string tel:string url:string identical_for_clientflag:boolean thanks_action_id:integer order_page_url:string comment:string business_hour:string holiday:string shortest_use_start_day:string
docker-compose run web bin/rails db:migrate

#-- サンクスページアクションボタン thanks_page_action_buttons
docker-compose run web bin/rails g scaffold thanks_page_action_button title:string url:string
docker-compose run web bin/rails db:migrate

#-- お知らせ notifications
#docker-compose run web bin/rails g scaffold notification title:string body:string begin_at:datetime end_at:datetime
docker-compose run web bin/rails db:migrate

#-- ユーザー users
docker-compose run web bin/rails g scaffold user email:string password:string last_name:string first_name:string last_name_kana:string first_name_kana:string
docker-compose run web bin/rails db:migrate

#-- 役割 roles
docker-compose run web bin/rails g scaffold role name:string
docker-compose run web bin/rails db:migrate

#-- ユーザー_役割 users_roles
docker-compose run web bin/rails g scaffold users_role user_id:integer role_id:integer
docker-compose run web bin/rails db:migrate

#-- 事業所_ユーザー offises_users
docker-compose run web bin/rails g scaffold offises_user office_id:integer user_id:integer block_flg:boolean
docker-compose run web bin/rails db:migrate

#-- 管理者 admins
docker-compose run web bin/rails g scaffold admin email:string password:string last_name:string first_name:string last_name_kana:string first_name_kana:string block_flg:boolean
docker-compose run web bin/rails db:migrate

#-- 非課金申請理由 non_billing_request_reasons
docker-compose run web bin/rails g scaffold non_billing_request_reason name:string
docker-compose run web bin/rails db:migrate

#-- 非課金申請 non_billing_requests
docker-compose run web bin/rails g scaffold non_billing_request order_id:integer non_billing_request_reason_id:integer request_reason_detail:string first_contacted_at:datetime second_contacted_at:datetime third_contacted_at:datetime begin_at:datetime admin_sms_comment:string judge_admin_id:integer approval_at:datetime denial_at:datetime relation_type_change_date_at:datetime judge_reason_for_user:string admin_comment:string
docker-compose run web bin/rails db:migrate

#-- 重複受注 duplicate_orders
docker-compose run web bin/rails g scaffold duplicate_order non_billing_request_id:integer order_id:integer
docker-compose run web bin/rails db:migrate

#-- 非課金申請調査履歴 non_billing_request_investigation_histories
docker-compose run web bin/rails g scaffold non_billing_request_investigation_history non_billing_request_id:integer, investigated_at:datetime, investigated_comment:string, investigated_id:integer
docker-compose run web bin/rails db:migrate

#-- 非課金申請エビデンス non_billing_request_evidences
docker-compose run web bin/rails g scaffold non_billing_request_evidence non_billing_request_id:integer file:string
docker-compose run web bin/rails db:migrate

#-- 受注時請求対象外理由 initial_billing_ignore_reasons
docker-compose run web bin/rails g scaffold initial_billing_ignore_reason name:string
docker-compose run web bin/rails db:migrate

#-- 受注 orders
docker-compose run web bin/rails g scaffold orders document_request_id:integer office_id:integer unit_individual_price_id:integer unit_facility_price_id:integer unit_price_relation_type_id:integer pushed_thanks_page_action_button_id:integer order_request_no_applicate_flg:boolean order_request_no_applicate_reson_id:integer relationship_types_id:integer
docker-compose run web bin/rails db:migrate

#-- 単価管理 unit_prices
docker-compose run web bin/rails g scaffold unit_price value:integer billing_code:string refund_code:string billing_invoice_name:string refund_invoice_name:string campagin_flg:boolean
#docker-compose run web bin/rails db:migrate
#
#-- 関係 relationships
docker-compose run web bin/rails g scaffold relationship relationship_type_name:string, relationship_id:integer
docker-compose run web bin/rails db:migrate

#-- 関係種別 relationship_types
docker-compose run web bin/rails g scaffold relationship_type relationship_type_name:string
docker-compose run web bin/rails db:migrate

#-- 要注意EU suspicious_end_users
docker-compose run web bin/rails g scaffold suspicious_end_user document_request_id:integer unknown_tel:string unknown_email:string call_prohibited_flg:boolean mail_prohibited_flg:boolean careful_eu_reson_id:integer
docker-compose run web bin/rails db:migrate

#-- 要注意EU理由 suspicious_end_user_reasons
docker-compose run web bin/rails g scaffold suspicious_end_user_reason suspicious_end_user_reason_comment:string
docker-compose run web bin/rails db:migrate

#-- 資料請求 document_requests
docker-compose run web bin/rails g scaffold document_request name:string name_hira:string tel:string email:string post_code:string prefectures_id:integer municipality_id:integer etc_address:string person_eat_id:integer order_plan_category_id:integer tel_other:string scd_site_code:string access_at:datetime, devise:string, site_lp:string, form:string, admin_comment:string, area_code_id:integer
docker-compose run web bin/rails db:migrate

#-- 資料請求_食事種類 document_request_meal_types
docker-compose run web bin/rails g scaffold document_request_meal_type document_request_id:integer meal_type_id:integer
docker-compose run web bin/rails db:migrate

#-- 注文予定日カテゴリ expected_order_date_categories
docker-compose run web bin/rails g scaffold expected_order_date_category expected_order_date_category_name:string
docker-compose run web bin/rails db:migrate

#-- EU対応履歴 contact_histories
docker-compose run web bin/rails g scaffold contact_history document_request_id:integer name:string name_hira:string email:string tel:string supported_at:datetime comment:string support_required_flg:boolean
#docker-compose run web bin/rails db:migrate

#-- エリアセット_エリアコード area_sets_area_codes
docker-compose run web bin/rails g scaffold area_sets_area_code area_set_id:integer area_code_id:integer
docker-compose run web bin/rails db:migrate

#-- エリアセット area_sets
docker-compose run web bin/rails g scaffold area_set office_id:integer name:string
docker-compose run web bin/rails db:migrate

#-- エリアセット掲載設定 area_set_publishing_settings
docker-compose run web bin/rails g scaffold area_set_publishing_setting office_id:integer area_set_id:integer meal_type_id:integer begin_at:datetime end_at:datetime reside_flg:boolean
docker-compose run web bin/rails db:migrate

# マイグレーション
#docker-compose run web bin/rails db:migrate

# seed 実行
#docker-compose run web bin/rails db:seed_fu
docker-compose run web bin/rails db:seed_fu FILTER=clients
docker-compose run web bin/rails db:seed_fu FILTER=offices
docker-compose run web bin/rails db:seed_fu FILTER=publishing_fees
docker-compose run web bin/rails db:seed_fu FILTER=basic_informations
docker-compose run web bin/rails db:seed_fu FILTER=notification_recipients
docker-compose run web bin/rails db:seed_fu FILTER=name_emails
docker-compose run web bin/rails db:seed_fu FILTER=advertisings
docker-compose run web bin/rails db:seed_fu FILTER=contract_billing_unit_prices
docker-compose run web bin/rails db:seed_fu FILTER=service_term_types
docker-compose run web bin/rails db:seed_fu FILTER=nav_settings
docker-compose run web bin/rails db:seed_fu FILTER=client_functional_restrictions
docker-compose run web bin/rails db:seed_fu FILTER=non_billing_requestable_user_categories
docker-compose run web bin/rails db:seed_fu FILTER=monthly_budgets
docker-compose run web bin/rails db:seed_fu FILTER=monthly_number_of_customers
docker-compose run web bin/rails db:seed_fu FILTER=billing_settings
docker-compose run web bin/rails db:seed_fu FILTER=billing_methods
docker-compose run web bin/rails db:seed_fu FILTER=client_publishing_settings
docker-compose run web bin/rails db:seed_fu FILTER=client_unit_prices
docker-compose run web bin/rails db:seed_fu FILTER=publishing_terms
docker-compose run web bin/rails db:seed_fu FILTER=publishing_priority_terms
docker-compose run web bin/rails db:seed_fu FILTER=publishing_priorities
docker-compose run web bin/rails db:seed_fu FILTER=partner_lists
docker-compose run web bin/rails db:seed_fu FILTER=partners
docker-compose run web bin/rails db:seed_fu FILTER=service_catalogs
docker-compose run web bin/rails db:seed_fu FILTER=service_catalog_temperature_zones
docker-compose run web bin/rails db:seed_fu FILTER=temperature_zones
docker-compose run web bin/rails db:seed_fu FILTER=other_incidental_services
docker-compose run web bin/rails db:seed_fu FILTER=service_catalog_other_incidental_services
docker-compose run web bin/rails db:seed_fu FILTER=supervisors
docker-compose run web bin/rails db:seed_fu FILTER=service_catalog_supervisors
docker-compose run web bin/rails db:seed_fu FILTER=order_unit_categories
docker-compose run web bin/rails db:seed_fu FILTER=service_catalog_order_unit_categories
docker-compose run web bin/rails db:seed_fu FILTER=meal_type_categories
docker-compose run web bin/rails db:seed_fu FILTER=service_catalog_meal_type_categories
docker-compose run web bin/rails db:seed_fu FILTER=order_methods
docker-compose run web bin/rails db:seed_fu FILTER=service_catalog_order_methods
docker-compose run web bin/rails db:seed_fu FILTER=shipping_methods
docker-compose run web bin/rails db:seed_fu FILTER=service_catalog_shipping_methods
docker-compose run web bin/rails db:seed_fu FILTER=payment_methods
docker-compose run web bin/rails db:seed_fu FILTER=service_catalog_payment_methods
docker-compose run web bin/rails db:seed_fu FILTER=meal_types
docker-compose run web bin/rails db:seed_fu FILTER=service_catalog_meal_types
docker-compose run web bin/rails db:seed_fu FILTER=office_unique_items
docker-compose run web bin/rails db:seed_fu FILTER=trial_terms
docker-compose run web bin/rails db:seed_fu FILTER=thanks_page_settings
docker-compose run web bin/rails db:seed_fu FILTER=thanks_page_action_buttons
docker-compose run web bin/rails db:seed_fu FILTER=notifications
docker-compose run web bin/rails db:seed_fu FILTER=users
docker-compose run web bin/rails db:seed_fu FILTER=roles
docker-compose run web bin/rails db:seed_fu FILTER=users_roles
docker-compose run web bin/rails db:seed_fu FILTER=offises_users
docker-compose run web bin/rails db:seed_fu FILTER=admins
docker-compose run web bin/rails db:seed_fu FILTER=non_billing_request_reasons
docker-compose run web bin/rails db:seed_fu FILTER=non_billing_requests
docker-compose run web bin/rails db:seed_fu FILTER=duplicate_orders
docker-compose run web bin/rails db:seed_fu FILTER=non_billing_request_investigation_histories
docker-compose run web bin/rails db:seed_fu FILTER=non_billing_request_evidences
docker-compose run web bin/rails db:seed_fu FILTER=initial_billing_ignore_reasons
docker-compose run web bin/rails db:seed_fu FILTER=orders
docker-compose run web bin/rails db:seed_fu FILTER=unit_prices
docker-compose run web bin/rails db:seed_fu FILTER=relationships
docker-compose run web bin/rails db:seed_fu FILTER=relationship_types
docker-compose run web bin/rails db:seed_fu FILTER=suspicious_end_users
docker-compose run web bin/rails db:seed_fu FILTER=suspicious_end_user_reasons
docker-compose run web bin/rails db:seed_fu FILTER=document_requests
docker-compose run web bin/rails db:seed_fu FILTER=document_request_meal_types
docker-compose run web bin/rails db:seed_fu FILTER=expected_order_date_categories
docker-compose run web bin/rails db:seed_fu FILTER=contact_histories
docker-compose run web bin/rails db:seed_fu FILTER=area_sets_area_codes
docker-compose run web bin/rails db:seed_fu FILTER=area_sets
docker-compose run web bin/rails db:seed_fu FILTER=area_set_publishing_settings



