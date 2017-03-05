require_relative "0_shared"

datasets = Hash.new([])

EXCLUDED_DATASETS = [
  "ReactJS Basics.csv",
  "Singing Lessons for Beginners.csv"
]

Dir[File.join(PAGEVIEWS_DATA_FOLDER, "*.csv")].each do |file|
  data = CSV.read(file)
  name = File.basename(file)

  next if EXCLUDED_DATASETS.include?(name)

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

datasets.keys.each do |k|
  values = datasets[k]
  new_values = [[1, 100]]

  previous_pageviews = values[0][1]
  values[1..-1].each do |number, pageviews|
    next if number > 16

    new_values << [number, 100 * pageviews / previous_pageviews]
  end

  datasets[k] = new_values
end

plot(
  xlabel: "Lesson number",
  ylabel: "Survival rate",
  image_file: "survival_curves",
  title: "How tos survival curves",
  datasets: datasets
)
