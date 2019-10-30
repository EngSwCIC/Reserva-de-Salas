FactoryBot.define do
    factory :user do
        email {'silva@silva.com'}
        password {'123123'}
        username {'testesilva'}
        registration {'150115464'}
        course {'Artes Cenicas'}
        is_admin {false}
    end
end