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
    id: item.tagline_id,
    content: item.content
  }
end

create_data_file(
  "_data/taglines.yml",
  :yaml,
  taglines
)
