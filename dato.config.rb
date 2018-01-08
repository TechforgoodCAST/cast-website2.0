data_files = [
  "_data/nav_titles.yml",
  "_data/taglines.yml",
  "_data/what_we_do.yml",
  "_data/six_tenets.yml"
]

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
  dato.six_tenets_2s.map { |item| item.content }
]

data_files.zip(data).map do |xs|
  create_data_file(
    xs[0],
    :yaml,
    xs[1]
  )
end
