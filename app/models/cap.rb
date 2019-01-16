class Cap < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :body, presence: true


  end
