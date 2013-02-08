class Chirp < ActiveRecord::Base
  belongs_to :user

  attr_accessor :user_name
  attr_accessible :content, :user_id, :user_name
end
