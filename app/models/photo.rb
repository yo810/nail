class Photo < ApplicationRecord

  has_one_attached :image

  has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def get_image(*size)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    if !size.empty?
      image.variant(resize: size)
    else
    image
    end
  end
end
