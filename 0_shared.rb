require "yt"
require "dotenv/load"
require "csv"
require "pp"
require "open3"

Yt.configure do |config|
  config.api_key = ENV["YT_API_KEY"]
end

PLAYLISTS = [
  "PL1HIh25sbqZnkA1T09UtVHoyjYaMJuK0a",
  "PL6gx4Cwl9DGBuKtLgPR_zWYnrwv-JllpA",
  "PLiyMO_9U8g1BNzo7ZoXwKg2Pqt5chP6CT",
  "PLLALQuK1NDriznzxP5rQkQwKIrGSWRMZF",
  "PLI37FJmOtrj0CeeQVTqaVD6UfHSRpG6NO",
  "PLQVvvaa0QuDfKTOs3Keq_kaG2P55YRn5v",
  "PL55RiY5tL51rrC3sh8qLiYHqUV3twEYU_"
]

PAGEVIEWS_DATA_FOLDER = "pageviews_data"

unless Dir.exists?(PAGEVIEWS_DATA_FOLDER)
  Dir.mkdir(PAGEVIEWS_DATA_FOLDER)
end

def plot(options)
  keys = options[:datasets].keys
  plot_titles = keys.map { |k| "'-' title '#{k}' with lines lw 1" }.join(", ")
  plot_data = keys.map { |k| options[:datasets][k].map { |r| r.join(" ") }.join("\n") }.join("\ne\n")

  commands = %{
    set terminal png size 1024,768 font "Inconsolata" 12
    set output '#{options[:image_file]}.png'

    set xlabel "#{options[:xlabel]}"

    set autoscale

    set ylabel "#{options[:ylabel]}"
    set format y '%.0s%c'

    set title "#{options[:title]}" font ",16"
    set grid

    set style data linespoints
    set multiplot
      plot #{plot_titles}
      #{plot_data}
    unset multiplot
  }

  commands << "\n"

  image, s = Open3.capture2("gnuplot", stdin_data: commands, binmode: true)
end
