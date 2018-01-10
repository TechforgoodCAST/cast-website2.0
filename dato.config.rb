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
  "taglines",
  "supporters_and_funders",
  "social_channels",
  "logos",
  "bespoke_project_orgs"
])

data = [
  {
    main_headline: dato.tagline.main_headline,
    what_we_believe: dato.tagline.what_we_believe,
    we_work_with_funders: dato.tagline.we_work_with_funders,
    how_we_help_charities: dato.tagline.how_we_help_charities,
    fuse_blurb: dato.tagline.fuse_blurb,
    fellowship_blurb: dato.tagline.fellowship_blurb,
    training_and_learning: dato.tagline.training_and_learning,
    know_your_audience: dato.tagline.know_your_audience,
    prototyping: dato.tagline.prototyping,
    user_testing: dato.tagline.user_testing,
    sustainability: dato.tagline.sustainability
  },
  dato.supporter_funders.map { |item| {
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
  {
    fuse: YamlHelper.add_origin(dato.logo.fuse_logo.path),
    fellowship: YamlHelper.add_origin(dato.logo.fellowship_logo.path)
  },
  dato.bespoke_project_orgs.map { |item| {
    image_url: YamlHelper.add_origin(item.image.path),
    image_alt: item.image.alt,
    image_title: item.image.title,
    name: item.name,
    link: item.link }
  }
]

paths.zip(data).map do |xs|
  create_data_file(xs[0], :yaml, xs[1])
end
