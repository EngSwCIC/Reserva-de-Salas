Dado("que eu esteja logado como admin com o email {string} e a senha {string}") do |email, password|
  User.create(username: 'yangalli', email: string, password: password,
    registration: "160149207", course: "CIC", is_admin: true
  )
  visit backoffice_path
  fill_in :user_email, with: email
  fill_in :user_password, with: password
end

Dado("que eu esteja cadastrado como usuario {string}, {string}, {string}, {string}, {string}") do |email, password, course, registration, username|
  @user = User.create(username: username, password: password,
  email: email, registration: registration, course: course, is_admin: false)
end

Quando("tiverem sido criados três usuários no sistema") do |password, registration, course|
  @user1 = User.create(username: "user1", password: password, email: "user1@gmail.com", registration: registration, course: course, is_admin: false)
  @user2 = User.create(username: "user2", password: password, email: "user2@gmail.com", registration: registration, course: course, is_admin: false)
  @user3 = User.create(username: "user3", password: password, email: "user3@gmail.com", registration: registration, course: course, is_admin: false)
end

Então("eu devo ver a contagem de 3 usuários no backoffice") do
  expect(User.all).to eq(3)
end
