# encoding: UTF-8

Keď /^Admin navštívi cestu "(.*?)"$/ do |path|
  visit path
end

Keď /^vyplní prihlasovacie údaje Správcu$/ do
  fill_in 'Email',                 with: 'keeper@email.com'
  fill_in 'Password',              with: '123456'
  fill_in 'Password confirmation', with: '123456'
end

Keď /^vyplní osobné údaje Správcu$/ do
  fill_in 'Firstname',   with: 'Anton'
  fill_in 'Lastname',    with: 'Oprátka'
  fill_in 'Phone',       with: '77 56 98 32'
  fill_in 'Street',      with: 'Ulica'
  fill_in 'No.',         with: 16
  fill_in 'Postal code', with: '900 46'
  fill_in 'City',        with: 'Brno'
end

Keď /^vyplní údaje Politika$/ do  
  fill_in 'Politician firstname', with: 'Gregor'
  fill_in 'Politician lastname',  with: 'Velký'
  select 'Prezidentské volby',    from: 'Volby'  
end

Tak /^vidí správu o úspešnom pridaní Správcu$/ do
  page.should have_content("'keeper@email.com' was successfully added.")
end

Tak /^vidí zoznam všetkých Správcov$/ do
  page.should have_content('Anton Oprátka')  
end

Keď /^Správca otvorí email "(.*?)"$/ do |address|
  open_email(address)
end