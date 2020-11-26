class ClientPublishingSetting < ApplicationRecord
  belongs_to :client
  has_many :publishing_terms, through: :client
end


# ClientPublishingSetting.limit(1).each do |cp|
#   p cp.client.admin_comment
#   p cp.client.client_unit_price.unit_price_id
# end
