require_relative "0_shared"

PAGEVIEWS_DATA_FOLDER = "pageviews_data"

unless Dir.exists?(PAGEVIEWS_DATA_FOLDER)
  Dir.mkdir(PAGEVIEWS_DATA_FOLDER)
end

def download_pageviews_data(playlists)
  playlists.each do |playlist_id|
    playlist = Yt::Playlist.new(id: playlist_id)
    data_file = File.join(PAGEVIEWS_DATA_FOLDER, "#{playlist.title}.csv")

    CSV.open(data_file, "w") do |csv|
      i = 0
      playlist.playlist_items.each do |video|
        video = video.video

        csv << [
          i + 1,
          video.title,
          video.view_count
        ]

        i += 1
      end
    end
  end
end

download_pageviews_data(PLAYLISTS)
