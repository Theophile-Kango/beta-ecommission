class Article < ApplicationRecord
    validates :title, :body, presence: true
    has_many :comments, dependent: :destroy
    has_many :users, through: :comments
end
