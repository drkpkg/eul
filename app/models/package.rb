class Package < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :receiver, optional: true
  belongs_to :container, optional: true
end
