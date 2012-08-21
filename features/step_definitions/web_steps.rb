# encoding: UTF-8

Pokiaľ /^je uživateľ na domovskej stránke$/ do
  visit '/'
end

Pokiaľ /^klikne na odkaz "(.*?)"$/ do |link|
  click_link link
end

Pokiaľ /^klikne na tlačítko "(.*?)"$/ do |button|
  click_button button
end

Tak /^vidí správu "(.*?)"$/ do |msg|
  page.should have_content(msg)
end

Tak /^nevidí správu "(.*?)"$/ do |msg|
  page.should_not have_content(msg)
end

Tak /^vidí odkaz "(.*?)"$/ do |link|
  page.should have_content(link)
end

Tak /^nevidí odkaz "(.*?)"$/ do |link|
  page.should_not have_content(link)
end

Keď /^pole "(.*?)" vyplní hodnotou "(.*?)"$/ do |field, value|
  fill_in field, with: value
end