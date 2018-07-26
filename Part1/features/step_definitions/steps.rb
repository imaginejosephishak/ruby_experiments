Given(/^I have opened (red fin) as (a anonymous user)$/) do |application, user|
  application.open_red_fin
  @current_user = user
end

When(/^(the user) searches for "(.*?)"$/) do |user, term|
  user.search(term)
end

Then(/^(red fin) should have a "(.*?)" search result$/) do |application, search_result|
  application.verify_search_result(search_result)
end
