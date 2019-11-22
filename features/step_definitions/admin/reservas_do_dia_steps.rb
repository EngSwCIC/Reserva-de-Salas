# coding: utf-8
# This is the steps file referred to criar_sala feature
# Place your code relative to that feature here

Então("eu devo ver somente a data de hoje") do
  date = Date.parse(DateTime.now.strftime("%y-%m-%d"))
  page.has_content?("#{date}")
end

# Quando("preencher o dia do aluguel com a data de hoje") do
#   # appointment_date =  Date.today()
#   appointment_date = Date.parse(DateTime.now.strftime("%y-%m-%d"))
# end

Quando("preencher o dia do aluguel com a data de hoje") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.rows_hash.each do |field, value|
    fill_in field, :with => Date.today
  end
end
