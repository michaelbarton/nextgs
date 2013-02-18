require 'rubygems'
require 'bundler/setup'

task :clean do
  `rm -rf output`
end

task :build => :clean do
  `nanoc compile`
end

task :watch do
  `nanoc watch`
end

task :view do
  `bundle exec rackup`
end

desc "Start nanoc watcher and viewer"
multitask :dev => [:watch,:view]

namespace :validate do

  task :html => :build do
    exec "nanoc check html"
  end

end

file '.git/refs/remotes/heroku' do
  `git remote add -f heroku git@heroku.com:scaffolder.git`
end

task :publish => ['.git/refs/remotes/heroku',:build] do
  print "Publish changes to heroku (yes|no) ? "
  unless STDIN.gets.chomp.downcase == "yes"
    puts('Aborting.')
    exit
  end
  puts "Pushing changes ..."

  branch = "heroku-#{Time.now.to_i}"

  `git push
  git checkout -b #{branch} master &&
  git add -f output &&
  git commit -m "Rebuild updated site" &&
  git push -f heroku #{branch}:refs/heads/master &&
  git checkout genomer &&
  git branch -D #{branch}`

  puts "Done"
end
