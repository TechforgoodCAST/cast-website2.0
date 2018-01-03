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
