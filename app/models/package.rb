class Package < ApplicationRecord
  belongs_to :user
  belongs_to :receiver
  belongs_to :container
end
