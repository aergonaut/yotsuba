class Variant < ApplicationRecord
  belongs_to :item, polymorphic: true
end
