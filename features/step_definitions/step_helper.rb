After do |scenario|
  if scenario.status == :failed && !page.current_url.blank? && Capybara.current_driver != :selenium
    puts "\033[36mINFO: Opening page in browser, serving static assets from: #{Capybara.asset_host}\033[0m\n\n"
    save_and_open_page
  end
end

