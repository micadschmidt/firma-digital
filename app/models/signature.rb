require 'active_model'

class Signature
  include ActiveModel::Model

  attr_accessor :name, :lastname, :date, :key

  validates :name, :lastname, :date, :key, presence: true
end
