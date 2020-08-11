class Event < ApplicationRecord
    belongs_to :host, foreign_key: "host_id", class_name: "User"

    has_many :attendances
    has_many :guests, through: :attendances, class_name: "User"

    validates :title, 
        presence: true,
        length: { in: 10..100}

    validates :description, 
        presence: true,
        length: {in: 70..500}
    
    validates :location, 
    presence: true
    
end
