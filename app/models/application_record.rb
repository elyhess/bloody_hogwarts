class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.order_alphabetically
    order(:name)
  end
end
