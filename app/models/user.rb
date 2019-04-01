class User < ActiveRecord::Base
  has_many :likeds
  has_many :quotes, through: :likeds, :foreign_key => "quote_id"
end
