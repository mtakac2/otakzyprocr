#encoding: UTF-8

Pokiaľ /^existuje Správca politických subjektov$/ do
  politician = FactoryGirl.create(:politician)  
  @keeper = politician.keeper
  politician.save
  @keeper.update_attributes(activation_code: nil)
end

Pokiaľ /^Správca je prihlásený do systému$/ do
  visit '/'
  click_link 'Přihlásit se'
  fill_in 'Email', with: @keeper.email
  fill_in 'Heslo', with: '123456'
  click_button 'Přihlásit se'
end

Keď /^je Správca na stránke so správou svojho účtu$/ do
  visit "/keepers/#{@keeper.id}/"
end

Keď /^vyplní údaje záhlavie a telo otázky$/ do
  fill_in 'Záhlaví', with: 'asdf'
end

Tak /^nachádza sa na stránke so správou svojho účtu$/ do
  pending # express the regexp above with the code you wish you had
end
