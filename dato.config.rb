data_files = [
  "nav_titles",
  "taglines",
  "what_we_do",
  "six_tenets",
  "supporters_and_funders",
  "social_channels"
].map { |file| "_data/#{file}.yml" }

data = [
  dato.nav_titles.map{ |item| {
    title: item.title,
    url: item.title.parameterize }
  },
  dato.taglines.map { |item| {
    id: item.tagline_id.parameterize,
    content: item.content }
  },
  dato.what_we_dos.map { |item| {
    content: item.content,
    color: item.color }
  },
  dato.tenets.map { |item| item.content },
  dato.supporter_funders.map { |item| {
    image_url: "https://www.datocms-assets.com" + item.image.path,
    image_alt: item.image.alt,
    image_title: item.image.title,
    name: item.name,
    link: item.link }
  },
  dato.social_channels.map { |item| {
    image_url: "https://www.datocms-assets.com" + item.image.path,
    image_alt: item.image.alt,
    image_title: item.image.title,
    link: item.link,
    name: item.name }
  }
]

data_files.zip(data).map do |xs|
  create_data_file(
    xs[0],
    :yaml,
    xs[1]
  )
end
