class Panel < ApplicationRecord


    validates :title, :body, presence: true

  end
