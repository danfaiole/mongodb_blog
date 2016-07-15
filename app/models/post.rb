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
  has_many :comments#, cascade_callbacks: true
  validates_associated :comments
  accepts_nested_attributes_for :comments

  def criado_em
    self.created_at.strftime("%d de %b de %Y") if self.created_at.present?
  end

  def editado_em
    self.updated_at.strftime("%d de %b de %Y") if self.updated_at.present?
  end

  def how_many_comms?
    count = self.comments.count
    if count == 0
      "Nenhum comentário"
    elsif count == 1
      "#{count} comentário"
    else
      "#{count} comentários"
    end
  end
end
