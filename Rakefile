require 'rubygems'
require 'bundler/setup'

task :clean do
  `rm -rf output`
end

# The scaffold format fetched master branch of scaffold API repo
file 'content/markup/scaffold-format.markdown' do |t|
  require 'tempfile'
  require './lib/content'

  tmp = Tempfile.new('scaffold-file-format')
  url = 'https://raw.github.com/next-gs/scaffolder-tools/master/man/scaffolder-format.7.ronn'
  `curl #{url} > #{tmp.path}`

  content = File.read(tmp.path).
    split("\n").
    drop(3).
    reverse.
    drop(5).
    reverse.
    map{|line| increase_markdown_header line }.
    unshift("---\n\s\stitle: Scaffold Format\n---").
    join("\n")

  File.open(t.name,'w'){|out| out.print content }
end

task :build => [:clean, 'content/markup/scaffold-format.markdown'] do
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

  task :links => :build do
    exec "nanoc check internal_links"
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
  git checkout develop &&
  git branch -D #{branch}`

  puts "Done"
end
