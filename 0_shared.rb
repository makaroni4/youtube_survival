require "yt"
require "dotenv/load"
require "csv"
require "pp"

Yt.configure do |config|
  config.api_key = ENV["YT_API_KEY"]
end

PLAYLISTS = [
  "PL1HIh25sbqZnkA1T09UtVHoyjYaMJuK0a",
  "PL6gx4Cwl9DGBuKtLgPR_zWYnrwv-JllpA",
  "PLiyMO_9U8g1BNzo7ZoXwKg2Pqt5chP6CT",
  "PLLALQuK1NDriznzxP5rQkQwKIrGSWRMZF",
  "PLI37FJmOtrj0CeeQVTqaVD6UfHSRpG6NO",
  "PLLALQuK1NDrjuYgMvG7mSIxpwZcwb3jjg",
  "PLQVvvaa0QuDfKTOs3Keq_kaG2P55YRn5v",
  "PL55RiY5tL51oyA8euSROLjMFZbXaV7skS",
  "PL55RiY5tL51rrC3sh8qLiYHqUV3twEYU_"
]
