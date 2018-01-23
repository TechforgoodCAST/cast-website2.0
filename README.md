# Cast Website (2.0)

second iteration of the CAST website.

Built with:

+ [Jekyll](https://jekyllrb.com/) (Static site generator)
+ [Tachyons](http://tachyons.io/) (CSS framework)
+ [PostCSS](http://postcss.org/) (Tool for transforming CSS with JS)
+ [Dato CMS](https://www.datocms.com/) (Pluggable CMS for static websites)

Deployed on: [Netlify](https://www.netlify.com/) (Static website hosting)

### Why a Static Site?

+ Extremely cheap (no hosting costs)
+ Extremely fast (serving static files is very fast and cacheable via a CDN (eg: Netlify))
+ Un-hackable (no server to be hacked)
+ No Server Maintenance (no server to be maintained)

The only traditional downside to static sites is the lack of easy access for non technical people to make changes. This has been made possible by integrating [Dato](https://www.datocms.com/), a lightweight pluggable content management system for static sites.

With this setup you can have your cake and eat it :cake:.

### Installation and Setup

To get up and running - make sure you have installed:

+ [node.js](https://nodejs.org/en/download/)
+ [ruby](https://www.codecademy.com/articles/ruby-setup)
+ [bundler](http://bundler.io/)
+ [jekyll](https://jekyllrb.com/docs/installation/)

Then clone this repo and `cd` into the directory.

install the node dependencies with:

```sh
> npm install
```

install the ruby dependencies with:

```sh
> bundle install
```

### Developing Locally

`Jekyll` has a development server you can run when making changes to the site, and the CSS can be watched and compiled using `PostCSS`.

To run the `Jekyll` server locally:

```sh
> jekyll serve
```

And to compile the CSS:

```sh
> npm run css
```

Or you can run the two of these together with:

```sh
> jekyll serve & npm run css
```

### Dato

[Dato](https://www.datocms.com/) is a service that allows you to store and edit content on the web, and pull it down locally to be turned into data files [Jekyll](https://jekyllrb.com/docs/installation/) can use.

To pull data from `Dato`:

```sh
> dato dump --token=<API_READONLY_TOKEN>
```

The `API_READONLY_TOKEN` can be found in the [dato admin dashboard](https://cast-website.admin.datocms.com/admin/access_tokens)

This will create new `yaml` files in the `_data` directory

### Extending Dato

To add different types of content to the site via dato, you can edit the `dato.config.rb` file. Just add a hash to the `data` array in the format:

```ruby
{
  file_name: "your_new_collection",
  data: dato.your_new_collection.map { |item| ...(transform returned data here) }
}
```

Then in the html / jekyll you can reference the new collection via:

```html
<p>{{ site.data.your_new_collection.some_field }}</p>
```

### Deploying

Is super simple: :sparkles:

+ When merging new commits into `master` [netlify](https://app.netlify.com/sites/wearecast/deploys) will auto deploy the site
+ After making changes to content in the [dato dashboard](https://cast-website.admin.datocms.com/editor), a user can click `publish` and the site will be deployed
