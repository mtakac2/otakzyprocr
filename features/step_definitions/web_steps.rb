# encoding: utf-8
require 'cucumber/formatter/unicode'

Pokiaľ /^je zaregistrovaný admin$/ do
  visit '/'
  fill_in 'Username',              :with => 'admin'
  fill_in 'Email',                 :with => 'admin@mail.com'
  fill_in 'Password',              :with => 'password'
  fill_in 'Password confirmation', :with => 'password'
  click_button 'Sign up'  
end

Pokiaľ /^nie je prihlásený$/ do
  click_link 'logout'
end

Keď /^sa volič zaregistruje$/ do  
  click_link 'Registrovat'
  fill_in 'Email',           :with => 'jrka@slaby.cz'
  fill_in 'Heslo',           :with => 'password'
  fill_in 'Potvrzení hesla', :with => 'password'
  click_button 'Registrovat'

  fill_in 'Jméno',           :with => 'Jirka'
  fill_in 'Přijmení',        :with => 'Slabý'
  select 'Brno',             :from => 'Okres'
  choose 'citizen_sex_male'
  select '32',               :from => 'Věk'
  click_button 'Registrovat'

  @user = Refinery::Citizens::Citizen.last
end

Tak /^je prihlásený do systému$/ do
  page.should have_content 'Odhlásit se'
  page.should have_content @user.email
  page.should_not have_content 'Registrovat se'
  page.should_not have_content 'Přihlásit se'
end

Tak /^vidí správu "(.*?)"$/ do |msg|
  page.should have_content msg
end

Keď /^sa volič pokúsi zaregistrovať a pole "(.*?)" vyplní hodnotou "(.*?)"$/ do |field, value|
  click_link 'Registrovat'
  fill_in field,             :with => value
  fill_in 'Heslo',           :with => 'password'
  fill_in 'Potvrzení hesla', :with => 'password'
  click_button 'Registrovat'
end

Tak /^vidí registračný formulár a pole "(.*?)" ma hodnotu "(.*?)"$/ do |field, value|
  page.should have_content 'Přihlasovací údaje'
  find_field(field).value.should eq(value)
end

Keď /^sa volič prihlási do systému$/ do
  @user = Refinery::Citizens::Citizen.create(:email => 'user@example.com',
    :password => '123456', :password_confirmation => '123456',
    :county_id => 1, :sex => 'female', :age => 32)

  click_link 'Přihlásit se'
  fill_in 'Email', :with => @user.email
  fill_in 'Heslo', :with => '123456'
  click_button 'Přihlásit se'
end

Tak /^vidí odkaz "(.*?)"$/ do |link|
  find_link link
end

Tak /^nevidí odkaz "(.*?)"$/ do |link|
  page.should_not have_content link
end

Keď /^sa pokúsi prihlásiť nezaregistrovaný volič$/ do
  @user = Refinery::Citizens::Citizen.new(:email => 'user@example.com',
    :password => '123456', :password_confirmation => '123456')

  click_link 'Přihlásit se'
  fill_in 'Email', :with => @user.email
  fill_in 'Heslo', :with => '123456'
  click_button 'Přihlásit se'
end

Keď /^sa volič odhlási zo systému$/ do
  click_link 'Odhlásit se'
end

Keď /^admin vytvorí voľby typu "(.*?)"$/ do |election_type|
  click_link 'Elections'
  click_link 'Add New Election'
  fill_in 'Election Type', :with => election_type
  select '2012', :from => 'election_held_1i'
  fill_in 'election_notes', :with => 'Lorem ipsum dolor sit amet...'
  click_button 'Save'
end

Tak /^vidí zoznam všetkých volieb$/ do
  pending # express the regexp above with the code you wish you had
end

Tak /^vidí práve vytvorené voľby$/ do
  pending # express the regexp above with the code you wish you had
end