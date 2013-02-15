namespace :mailservers do 
  desc 'Create queries for all the mail servers against all the block list servers'
  task :checkall => :environment do
    Query.query_all_servers
  end
end