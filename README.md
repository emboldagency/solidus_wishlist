# Solidus Wishlist (Embold Fork)

[![Build and Deploy](https://embold.net/api/github/badge/workflow-status.php?repo=solidus_wishlistworkflowrelease.yml&workflow=build-and-deploy.yml)](https://github.com/emboldagency/solidus_wishlistworkflowrelease.yml/actions/workflows/build-and-deploy.yml) <!--
-->![Semantic Versioning](https://embold.net/api/github/badge/semver.php?repo=solidus_wishlistworkflowrelease.yml&)

This is a modernized fork of the original Solidus Wishlist extension, maintained by [Embold Agency](https://embold.com/). It supports Rails 8, Ruby 3.4+, and Solidus 5, with updated dependencies, improved test infrastructure, and code quality enhancements.

The extension enables multiple wishlists per user, with public (sharable) and private options.

---

## Installation

Add the following to your `Gemfile`:
```ruby
gem 'solidus_wishlist', github: 'emboldagency/solidus_wishlist', branch: 'master'
```

(Untested) If you want to disable defacing of product/user views, add the following to your `Gemfile`:
```ruby
(Untested) gem 'solidus_wishlist', github: 'emboldagency/solidus_wishlist', branch: 'master', require: 'solidus_wishlist_no_deface'
```

(Untested) If you want to include the ability to email a friend your wishlist, add the following to your `Gemfile`:
```ruby
gem 'solidus_email_to_friend', github: 'boomerdigital/solidus_email_to_friend', branch: 'master'
```

Run
```sh
$ bundle install
$ bundle exec rails g solidus_wishlist:install
```

---

## Testing

Tests use Capybara and Selenium (no PhantomJS required). To run tests:
```shell
bundle install
bundle exec rake
```

When testing your application's integration with this extension, you may use its factories. Add this require statement to your spec_helper:
```ruby
require 'solidus_wishlist/factories'
```

---

## Contributing

[See corresponding guidelines][1]

---

Copyright (c) 2009-2015 [Spree Commerce Inc.][4], [contributors][5], and [Embold Agency](https://embold.net/), released under the [New BSD License][3]

[1]: https://github.com/emboldagency/solidus_wishlist/blob/master/CONTRIBUTING.md
[3]: https://github.com/emboldagency/solidus_wishlist/blob/master/LICENSE.md
[4]: https://github.com/spree
[5]: https://github.com/emboldagency/solidus_wishlist/graphs/contributors
