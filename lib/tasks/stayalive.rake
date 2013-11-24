desc "This task is called by the Heroku cron add-on"
task :stayalive => :environment do
  uri = URI.parse('http://ttracker-dev.herokuapp.com/')
  Net::HTTP.get(uri)
end