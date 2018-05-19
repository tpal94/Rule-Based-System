namespace :remove do
  desc "remove unwanted rules"
  task :unwanted_rules => :environment do
    Rule.where(name: ["Excluded product", "Excluded Category", "Shopping"]).delete_all
  end
end
