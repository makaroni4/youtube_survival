require_relative "0_shared"

datasets = Hash.new([])

Dir[File.join(PAGEVIEWS_DATA_FOLDER, "*.csv")].each do |file|
  data = CSV.read(file)
  name = File.basename(file)

  previous_pageviews = data[0][2].to_i

  data.each do |row|
    number = row[0].to_i
    pageviews = row[2].to_i

    if pageviews > previous_pageviews
      datasets[name] += [[number, previous_pageviews]]
    else
      datasets[name] += [[number, pageviews]]
      previous_pageviews = pageviews
    end
  end
end

plot(
  xlabel: "Lesson number",
  ylabel: "Pageviews count",
  image_file: "raw_data_no_spikes",
  title: "How tos raw pageviews without viral videos",
  datasets: datasets
)
