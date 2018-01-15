module YamlHelper
  def YamlHelper.dato_origin(path)
    "https://www.datocms-assets.com" + path
  end

  def YamlHelper.to_file_path(file_name)
    "_data/#{file_name}.yml"
  end
end

# file name and corresponding data to be fetched from dato
data = [
  {
    file_name: "supporters_and_funders",
    data: dato.supporter_funders.map { |item| {
      image_url: YamlHelper.dato_origin(item.image.path),
      image_alt: item.image.alt,
      image_title: item.image.title,
      name: item.name,
      link: item.link }
    }
  },
  {
    file_name: "clients_and_supporters",
    data: dato.client_supporters.map { |item| {
      image_url: YamlHelper.dato_origin(item.image.path),
      image_alt: item.image.alt,
      image_title: item.image.title,
      name: item.name,
      link: item.link }
    }
  },
  {
    file_name: "social_channels",
    data: dato.social_channels.map { |item| {
      image_url: YamlHelper.dato_origin(item.image.path),
      image_alt: item.image.alt,
      image_title: item.image.title,
      link: item.link,
      name: item.name,
      description: item.description }
    }
  },
  {
    file_name: "bespoke_project_orgs",
    data: dato.bespoke_project_orgs.map { |item| {
      image_url: YamlHelper.dato_origin(item.image.path),
      image_alt: item.image.alt,
      image_title: item.image.title,
      name: item.name,
      link: item.link }
    }
  },
  {
    file_name: "fuse_alumni",
    data: dato.fuse_alumnis.map { |item| {
      image_url: YamlHelper.dato_origin(item.image.path),
      image_alt: item.image.alt,
      image_title: item.image.title,
      link: item.link,
      name: item.name }
    }
  },
  {
    file_name: "team",
    data: dato.teams.map { |item| {
      image_url: YamlHelper.dato_origin(item.image.path),
      name: item.name,
      job_title: item.job_title,
      description: item.description }
    }
  },
  {
    file_name: "board",
    data: dato.boards.map { |item| {
      image_url: YamlHelper.dato_origin(item.image.path),
      name: item.name,
      description: item.description }
    }
  }
]

# creates yaml files for each collection of data
data.each do |collection|
  file = YamlHelper.to_file_path(collection[:file_name])
  create_data_file(file, :yaml, collection[:data])
end
