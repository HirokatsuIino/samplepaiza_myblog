class Client < ApplicationRecord
  has_one :client_publishing_setting, foreign_key: 'client_id'
  has_one :client_unit_price, foreign_key: 'client_id'
end
