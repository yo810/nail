class Menu < ApplicationRecord

  has_one_attached :image
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  enum course: { short: 0, middle: 1, long: 2 }

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def with_tax_price
    (price * 1.1).floor
  end

end
