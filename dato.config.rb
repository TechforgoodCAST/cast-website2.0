nav_titles = dato.nav_titles.map do |item|
  {
    order: item.order,
    title: item.title,
    url:   item.title.parameterize
  }
end

create_data_file(
  "_data/nav_titles.yml",
  :yaml,
  nav_titles
)

taglines = dato.taglines.map do |item|
  {
    id: item.tagline_id.parameterize,
    content: item.content
  }
end

create_data_file(
  "_data/taglines.yml",
  :yaml,
  taglines
)

what_we_do = dato.what_we_dos.map do |item|
  {
    order: item.order,
    content: item.content,
    color: item.color
  }
end

create_data_file(
  "_data/what_we_do.yml",
  :yaml,
  what_we_do
)
