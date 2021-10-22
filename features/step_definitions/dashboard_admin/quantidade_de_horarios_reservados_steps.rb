#language: pt
#encoding: utf-8

Dado("que eu seja admin do sistema com email {string} e senha {string}") do |string, string2|
    User.create(username: 'admin', email: string, password: string2,
        registration: "15015296", course: "CIC", is_admin: true
    )
    visit new_user_session_path
    fill_in :user_email, with: string
    fill_in :user_password, with: string2
    click_button "Log in"
end

Dado('que esteja na página {string}') do |string|
    visit(backoffice_path)
end

Entao('eu devo ver {string}') do |string|
    page.has_content?("#{string}")
end

Entao('devo ver {string}') do |string|
    page.has_content?("#{string}")
end
  