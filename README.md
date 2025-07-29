# Solidus Wishlist

[![release.yml](https://embold.net/api/github/badge/workflow-status.php?repo=solidus_wishlist&workflow=release.yml)](https://github.com/emboldagency/solidus_wishlist/actions/workflows/release.yml) <!--
-->[![ci.yml](https://embold.net/api/github/badge/workflow-status.php?repo=solidus_wishlist&workflow=ci.yml)](https://github.com/emboldagency/solidus_wishlist/actions/workflows/ci.yml) <!--
-->![Semantic Versioning](https://embold.net/api/github/badge/semver.php?repo=solidus_wishlist)

The extension enables multiple wishlists per user, with public (sharable) and private options.

## Fork Notice

This repository is a fork of the original Solidus Wishlist extension. It supports Rails 8, Ruby 3.4+, and Solidus 5, with updated dependencies, improved test infrastructure, and code quality enhancements.
It may include customizations, fixes, or changes specific to the needs of emboldagency or its clients. For updates and documentation, refer to this repository: [emboldagency/solidus_handling_fees](https://github.com/emboldagency/solidus_handling_fees).

## Installation

Add `solidus_wishlist` to your Gemfile:

```ruby
gem 'solidus_wishlist', github: 'emboldagency/solidus_wishlist', branch: 'master'
```

(Untested) If you want to disable defacing of product/user views, add the following to your `Gemfile`:
```ruby
gem 'solidus_wishlist', github: 'emboldagency/solidus_wishlist', branch: 'master', require: 'solidus_wishlist_no_deface'
```

(Untested) If you want to include the ability to email a friend your wishlist, add the following to your `Gemfile`:
```ruby
gem 'solidus_email_to_friend', github: 'boomerdigital/solidus_email_to_friend', branch: 'main'
```

Bundle your dependencies and run the installation generator:
```sh
$ bundle install
$ bundle exec rails g solidus_wishlist:install
```

## Testing

Tests use Capybara and Selenium (no PhantomJS required). To run tests:
```shell
bundle install
bundle exec rake
```

When testing your application's integration with this extension, you may use its factories.
Simply add this require statement to your spec_helper:

```ruby
require 'solidus_wishlist/factories'
```

## Contributing

[See corresponding guidelines][1]

Copyright (c) 2009-2015 [Solidus][4], [contributors][5], and [Embold](https://embold.com/), released under the [New BSD License][3]

[1]: https://github.com/emboldagency/solidus_wishlist/blob/master/CONTRIBUTING.md
[3]: https://github.com/emboldagency/solidus_wishlist/blob/master/LICENSE.md
[4]: https://github.com/solidusio
[5]: https://github.com/emboldagency/solidus_wishlist/graphs/contributors
