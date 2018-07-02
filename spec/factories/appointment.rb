FactoryBot.define do
    factory :appointment do
        appointment_date { Date.today + 1 } 
        start_time '10:00:00'
    end
end