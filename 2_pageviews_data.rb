require_relative "0_shared"

def download_pageviews_data(playlists, data_folder)
  playlists.each do |playlist_id|
    playlist = Yt::Playlist.new(id: playlist_id)
    data_file = File.join(data_folder, "#{playlist.title}.csv")

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

download_pageviews_data(PLAYLISTS, PAGEVIEWS_DATA_FOLDER)
