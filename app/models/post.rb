class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  #Fields
  field :title, type: String
  field :content, type: String

  #Validations
  validates :title, presence: true, length: { minimum: 3 }
  validates :content, presence: true, length: { minimum: 15 }

  #Relations
  embeds_many :comments
end
