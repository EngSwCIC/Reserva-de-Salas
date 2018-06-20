FactoryBot.define do
    factory :appointment do
        user { create(:user) }
        room { create(:room) }
        appointment_date '22-06-2018'
        start_time '10:00:00'
        user_id user.id
        room_id room.id
    end
end