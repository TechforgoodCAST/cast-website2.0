module YamlHelper
  def YamlHelper.add_origin(path)
    "https://www.datocms-assets.com" + path
  end

  def YamlHelper.file_paths(paths)
    paths.map { |p| YamlHelper.to_file_path(p) }
  end

  private
  def YamlHelper.to_file_path(file_name)
    "_data/#{file_name}.yml"
  end
end

paths = YamlHelper.file_paths([
  "supporters_and_funders",
  "clients_and_supporters",
  "social_channels",
  "bespoke_project_orgs",
  "fuse_alumni"
])

data = [
  dato.supporter_funders.map { |item| {
    image_url: YamlHelper.add_origin(item.image.path),
    image_alt: item.image.alt,
    image_title: item.image.title,
    name: item.name,
    link: item.link }
  },
  dato.client_supporters.map { |item| {
    image_url: YamlHelper.add_origin(item.image.path),
    image_alt: item.image.alt,
    image_title: item.image.title,
    name: item.name,
    link: item.link }
  },
  dato.social_channels.map { |item| {
    image_url: YamlHelper.add_origin(item.image.path),
    image_alt: item.image.alt,
    image_title: item.image.title,
    link: item.link,
    name: item.name }
  },
  dato.bespoke_project_orgs.map { |item| {
    image_url: YamlHelper.add_origin(item.image.path),
    image_alt: item.image.alt,
    image_title: item.image.title,
    name: item.name,
    link: item.link }
  },
  dato.fuse_alumnis.map { |item| {
    image_url: YamlHelper.add_origin(item.image.path),
    image_alt: item.image.alt,
    image_title: item.image.title,
    link: item.link,
    name: item.name }
  },
]

paths.zip(data).map do |xs|
  create_data_file(xs[0], :yaml, xs[1])
end
