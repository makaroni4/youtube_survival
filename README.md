# Youtube how tos survival analysis

![Youtube survival curves](https://github.com/makaroni4/youtube_survival/blob/master/survival_curves.png?raw=true)

## Setup

Create Youtube API key as described [here](https://github.com/Fullscreen/yt#apps-that-do-not-require-user-interactions).

Create `.env` file with this API key as shown in  `.env.template`:

~~~
YT_API_KEY=BIzaXiO_1J4s7vukMpFyjODxDo87l9-bR1oKcnx
~~~

Install necessary libraries:

~~~
bundle install
~~~

You are ready to go:

~~~
ruby 1_markdown_links.rb
ruby 2_pageviews_data.rb
ruby 3_plot_survival_curves.rb
ruby 4_filter_exceptions.rb
ruby 5_survival_rates.rb
~~~
