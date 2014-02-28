class SeedDataase < ActiveRecord::Migration
  def change
    5.times do |i|
      Post.create(:title => "Title #{i+1}", :content => "Post #{i+1}")
    end
  end
end
