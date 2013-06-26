Given(/^I visit the "(.*?)" page$/) do |page_name|
  visit path_to(page_name)
end

Then(/^I should see a slider$/) do
  page.should have_css('.slider-container .ui-slider')
end

Then(/^I should see a slider called "(.*?)"$/) do |name|
  @slider_name = name
  page.should have_css('.slider-container .ui-slider')
  page.should have_css(".slider-container input[id='#{@slider_name}']", visible: false)
end

Then(/^I set the slider value to "(.*?)"$/) do |value|
  page.execute_script "s=$('.slider').first();"
  page.execute_script "s.slider('option','slide').call(s,null,{ handle: $('.ui-slider-handle', s), value: #{value} });"
end

Then(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in(field, with: value)
end

Then(/^I press "(.*?)"$/) do |text|
  click_button(text)
end

Then(/^I should see "(.*?)"$/) do |content|
  page.should have_content(content)
end

def path_to(page_name)
  send("#{page_name}_path")
end
