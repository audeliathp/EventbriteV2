class Attendance < ApplicationRecord
    belongs_to :guest, foreign_key: 'guest_id', class_name: "User"
    belongs_to :event
end
