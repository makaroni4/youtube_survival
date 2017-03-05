require_relative "0_shared"

datasets = Hash.new([])

Dir[File.join(PAGEVIEWS_DATA_FOLDER, "*.csv")].each do |file|
  data = CSV.read(file)
  name = File.basename(file)

  data.each do |row|
    datasets[name] += [[row[0], row[2]]]
  end
end

plot(
  xlabel: "Lesson number",
  ylabel: "Pageviews count",
  image_file: "raw_data",
  title: "How tos raw pageviews data",
  datasets: datasets
)
