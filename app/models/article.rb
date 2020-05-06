class Article < ApplicationRecord
    validates :title, :body, presence: true
    has_many :comments, dependent: :destroy
    belongs_to :user
end
