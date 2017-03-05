require_relative "0_shared"

def markdown_links(playlists)
  playlists.each do |playlist_id|
    playlist = Yt::Playlist.new(id: playlist_id)

    title = playlist.title
    url = "https://www.youtube.com/watch?v=#{playlist.playlist_items.first.video_id}&list=#{playlist.id}"

    puts "[#{title}](#{url})"
  end
end

markdown_links(PLAYLISTS)
