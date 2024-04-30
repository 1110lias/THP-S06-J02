class Message < ApplicationRecord
    belongs_to :user
    has_many :recipients
    has_many :users, through: :recipients
    validates :message, 
    presence: true
end
