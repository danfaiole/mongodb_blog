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

  def criado_em
    self.created_at.strftime("%d de %b de %Y as %H:%M")
  end

  def editado_em
    self.updated_at.strftime("%d de %b de %Y as %H:%M")
  end

end
