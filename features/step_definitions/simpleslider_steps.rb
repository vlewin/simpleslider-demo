Given /^There (is|are) (.+) (post|posts)$/ do |_, amount, _|
  @posts_count = amount.to_i
  @posts_count.times do |i|
    Post.create(:title => "Title #{i+1}", :content => "Post #{i+1}")
  end
end

When /^I visit '(.*)'$/ do |route|
  visit route
end

When /^I reload the page$/ do
  visit page.evaluate_script('window.location.href')
end

And /^I click the (.*?)'(.*)' link$/ do |number, text|
  number = number.strip

  if number.present?
    mapping = {
      'first'   => 0,
      'second'  => 1,
      'third'   => 2,
      'fourth'  => 3,
      'fifth'   => 4,
      'sixth'   => 5,
      'seventh' => 6,
      'eighth'  => 7,
      'ninth'   => 8,
      'tenth'   => 9
    }

    page.all('a', :text => text)[mapping[number]].click
  else
    click_link(text)
  end
end

Then(/^I click browser (.*) button$/) do |button|
  page.evaluate_script("window.history.#{button}()")
end

Then /^I (should|should not) see '(.+)'$/ do |condition, text|
  # switch to regexp matching if needed
  text = Regexp.new text[1..-2] if text.match "^/.+/$"
  if condition == 'should'
    assert page.has_content?(text)
  else
    assert page.has_no_content?(text)
  end
end

Then /^I (should|should not) see '(.+)' link$/ do |condition, text|
  if condition == 'should'
    assert find_link(text).visible?
  else
    assert !find_link(text).visible?
  end
end

Then /^I (should|should not) see a breadcrumb$/ do |condition|
  if condition == 'should'
    assert page.has_css?('#breadcrumb', :visible => true)
    assert page.has_css?('#breadcrumb li', :count => 2)
    # assert page.has_css?('#breadcrumb li')
    # assert find('#breadcrumb').visible?
    # assert_equal(2, find("#breadcrumb").all("li").count)
  else
    assert page.has_css?('#breadcrumb', :visible => false)
    assert page.has_no_css?('#breadcrumb li', :visible => false)
    assert page.has_css?('#breadcrumb li', :count => 0)
  end
end

Then /^I should be on the '(index|details)' page$/ do |location|
  if location == 'index'
    step "I should see 'Index page'"
    step "I should not see a breadcrumb"
    step "I should see all posts"
  else
    step "I should see a breadcrumb"
    step "I should see 'Title 1'"
    step "I should see 'Back' link"
    step "I should not see 'Index page'"
  end
end

Then /^I should see all posts$/ do
  assert_equal(@posts_count, page.all('a.slink').count)
end

# Helper steps
Then /^Show me the page$/ do
  puts "\033[36mINFO: Opening page in browser, serving static assets from: #{Capybara.asset_host}\033[0m\n\n"
  save_and_open_page
end

When /^Show current page url$/ do
  puts  page.evaluate_script('window.location.href')
end

Then /^I wait (.*) seconds$/ do |time|
  sleep time.to_i
end
