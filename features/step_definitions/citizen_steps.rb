# encoding: UTF-8

Pokiaľ /^existuje Admin$/ do
  admin = FactoryGirl.create(:admin)
  admin.add_role 'refinery'
  admin.add_role 'superuser'
end

Pokiaľ /^existuje otazka$/ do 
  @question = FactoryGirl.create(:question)    
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
  choose "question_id_#{@question.id}"
  click_button 'Registrovat se'
end