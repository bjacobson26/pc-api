require 'httparty'
# /bills?history.active=true&order=last_action_at
API_URL = ENV['SUNLIGHT_API_URL'] 
API_KEY = ENV['SUNLIGHT_API_KEY']

namespace :bills do
  task :recent => :environment do
    bill_ids = []

    page = 1

    until page == 31
      puts "Getting results from page #{page}"
      active_recent = '/bills?history.active=true&order=last_action_at'
      endpoint = API_URL + active_recent + "&apikey=#{API_KEY}" + "&page=#{page}"
      resp = HTTParty.get(endpoint)

      resp['results'].each do |data|
        bill_ids << data['bill_id']
      end
      page += 1
    end

    bill_ids.each do |bill_id|
      Bill.find_or_create(bill_id)
    end
    puts "All done! Have a nice day! :)"

  end
end
