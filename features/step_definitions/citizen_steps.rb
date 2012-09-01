# encoding: UTF-8

Pokiaľ /^existuje otázka$/ do 
  @question = FactoryGirl.create(:question)    
end

Pokiaľ /^existuje Volič$/ do
  @user = FactoryGirl.create(:citizen, password: 'my_pass',
    password_confirmation: 'my_pass')
  @user.next_step
  @user.next_step
  @user.update_attributes(activation_code: nil)
end

Pokiaľ /^existuje volič s emailom "(.*?)"$/ do |email|
  @user = FactoryGirl.create(:citizen, email: email)
end

Pokiaľ /^existuje politik s emailom "(.*?)"$/ do |email|
  @keeper = FactoryGirl.create(:politician_keeper, email: email)
end


Keď /^volič vyplní svoje uživateľské registračné údaje$/ do
  visit '/'
  click_link 'Registrovat se'

  fill_in 'Email',           with: 'user@mail.com'
  fill_in 'Heslo',           with: 'user_password'
  fill_in 'Potvrzení hesla', with: 'user_password'
  click_button 'Pokračovat'
end

Keď /^volič vyplní svoje osobné registračné údaje$/ do
  fill_in 'Jméno',              with: 'Ivan'
  fill_in 'Přijmení',           with: 'Homola'
  select  'Brno',               from: 'Okres'
  choose  'citizen_gender_male'
  select  '25',                 from: 'Věk'
  click_button 'Pokračovat'
end

Keď /^volič si pri registrácii vyberie otázku$/ do
  fill_in 'Hodiny', with: 50
  choose "question_id_#{@question.id}"
  click_button 'Registrovat se'
end

Keď /^volič si pri registrácii nevyberie otázku$/ do
  click_button 'Registrovat se'
end

Keď /^sa volič pokúsi zaregistrovať a pole "(.*?)" vyplní hodnotou "(.*?)"$/ do |field, value|
  visit '/'
  click_link 'Registrovat se'
  fill_in field, with: value
  click_button 'Pokračovat'
end

Tak /^vidí registračný formulár a pole "(.*?)" ma hodnotu "(.*?)"$/ do |field, value|
  find('form#registration_form')
  find("input#citizen_#{field.downcase}").value.should eq value
end

Keď /^volič vyplní svoje osobné registračné údaje bez okresu a pohlavia$/ do
  click_button 'Pokračovat'
end

Keď /^sa volič prihlási do systému$/ do
  visit '/'
  click_link 'Přihlásit se'
  fill_in 'Email',    with: @user.email
  fill_in 'Heslo', with: @user.password
  click_button 'Přihlásit se'
end

Keď /^sa pokúsi prihlásiť nezaregistrovaný volič$/ do
  visit '/'
  click_link 'Přihlásit se'
  fill_in 'Email',    with: 'unregistered@mail.com'
  fill_in 'Heslo', with: 'whatever'
  click_button 'Přihlásit se'
end

Keď /^sa volič odhlási zo systému$/ do
  click_link 'Odhlásit se'
end