task :travis do
  system("export DISPLAY=:0 && bundle exec rake cucumber")
  raise "rake cucumber failed!" unless $?.exitstatus == 0
end
