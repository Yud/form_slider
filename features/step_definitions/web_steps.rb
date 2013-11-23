Given(/^I visit the "(.*?)" page$/) do |page_name|
  visit path_to(page_name)
end

Given(/^I visit the "(.*?)" page and disabled is set to true$/) do |page_name|
  visit path_to(page_name, disabled: true)
end

Then(/^it should be disabled$/) do
  @current_slider[:class].should =~ /ui-slider-disabled ui-state-disabled/
end

Then(/^I should see a slider$/) do
  page.should have_css('.slider-container .ui-slider')
end

Then(/^I should see a slider called "(.*?)"$/) do |name|
  @slider_name = name
  page.should have_css(".slider-container .ui-slider.#{name}")
  page.should have_css(".slider-container input[id$=#{@slider_name}]", visible: false)
  @current_slider = page.find(".slider-container .ui-slider.#{name}")
end

Then(/^I set the slider's value to "(.*?)"$/) do |value|
  page.execute_script "s=$('.ui-slider.#{@slider_name}');"
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

def path_to(page_name, params=nil)
  send("#{page_name}_path", params)
end
