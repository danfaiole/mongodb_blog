class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  #Fields
  field :user_name, type: String
  field :content, type: String

  #Validations
  validates :user_name, presence: true, length: { minimum: 3 }
  validates :content, presence: true, length: { minimum: 3 }

  #Relations
  embedded_in :post
end
