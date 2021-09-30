# This is the steps file referred to index_for_appointments feature
# Place your code relative to that feature here

#E("data e horário atual sejam após {string}") do |string|
    #(Time.now).to be > string.to_datetime
#end    

Dado("que a data e horário atual sejam após  {string}") do |string|
   expect(Time.now).to be > string.to_datetime
end