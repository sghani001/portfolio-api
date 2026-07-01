namespace :gems do
  desc "Sync all gems from RubyGems.org using the RUBYGEMS_API_KEY"
  task sync: :environment do
    gems = RubygemsClient.fetch_all

    gems.each do |data|
      GemStat.upsert(
        { name: data[:name], downloads: data[:downloads], version: data[:version], updated_at: data[:updated_at] },
        unique_by: :name
      )
    end

    active = gems.map { |g| g[:name] }
    removed = GemStat.where.not(name: active).destroy_all.count

    puts "Synced #{gems.size} gems, removed #{removed} stale entries"
  rescue RubygemsClientError => e
    puts "ERROR: #{e.message}"
  end

  desc "List all tracked gems"
  task list: :environment do
    GemStat.order(:name).each do |g|
      puts "#{g.name} — #{g.downloads} downloads, #{g.version} (updated #{g.updated_at})"
    end
  end
end