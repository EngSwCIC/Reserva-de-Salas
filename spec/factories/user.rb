FactoryBot.define do
    factory :user do
        email 'silva@silva.com'
        password '123123'
        username 'testesilva'
        registration '150115464'
        course 'Artes Cenicas'
        reset_token '1pEbBAmlTGJRxb_LBYB4cQ'
        is_admin false
    end
end