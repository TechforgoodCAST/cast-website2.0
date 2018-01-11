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
  "home_text",
  "for_charities_text",
  "fuse_text",
  "supporters_and_funders",
  "social_channels",
  "logos",
  "bespoke_project_orgs"
])

data = [
  {
    main_headline: dato.home_text.main_headline,
    what_we_believe: dato.home_text.what_we_believe,
    we_work_with_funders: dato.home_text.we_work_with_funders,
    how_we_help_charities: dato.home_text.how_we_help_charities
  },
  {
    fuse_blurb: dato.for_charities_text.fuse_blurb,
    fellowship_blurb: dato.for_charities_text.fellowship_blurb,
    training_and_learning: dato.for_charities_text.training_and_learning,
    know_your_audience: dato.for_charities_text.know_your_audience,
    prototyping: dato.for_charities_text.prototyping,
    user_testing: dato.for_charities_text.user_testing,
    sustainability: dato.for_charities_text.sustainability
  },
  {
    headline: dato.fuse_text.headline,
    what_is_it: dato.fuse_text.what_is_it,
    how_does_it_work: dato.fuse_text.how_does_it_work
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
