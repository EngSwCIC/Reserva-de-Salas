# coding: utf-8
# This is the steps file referred to criar_sala feature
# Place your code relative to that feature here

Então("eu devo ver somente a data de hoje") do
  date = Date.parse(DateTime.now.strftime("%y-%m-%d"))
  page.has_content?("#{date}")
end
