FactoryBot.define do
    factory :admin do
        email {'admin@admin.com'}
        password {'123123'}
        password_confirmation {'123123'}
        username {'teste'}
        registration {'150115464'}
        course {'Artes Cenicas'}
        is_admin {true}
    end
end