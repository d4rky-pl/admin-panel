Admin Panel [![Build Status](https://secure.travis-ci.org/d4rky-pl/admin-panel.png)](http://travis-ci.org/d4rky-pl/admin-panel) [![Code Climate](https://codeclimate.com/github/d4rky-pl/admin-panel.png)](https://codeclimate.com/github/d4rky-pl/admin-panel) [![Gem Version](https://badge.fury.io/rb/admin-panel.png)](http://badge.fury.io/rb/admin-panel)
===========

This gem has been created as a recruitment task I was given. It's a set of generators to create administration panel for your website.

Installation
------------

Start with adding these gems to your Gemfile:

```ruby
gem 'admin-panel', '~> 0.1.5'
gem 'devise', '~> 3.2'
gem 'simple_form', '3.1.0.rc1'
gem 'bootstrap-sass', '~> 3.1'
gem 'kaminari', '~> 0.16.1'
```

Then do `bundle install` and run the installer:

```bash
$ rails generate admin_panel:install
```

Using the scaffolder
--------------------

The scaffolder has basically the same syntax as the Rails one, except there's currently no support for custom namespace.

```bash
$ rails generate admin_panel:scaffold NAME [field:type field:type ...]
```

Running tests
-------------

Tests can be run using `rake spec`. They are written using rspec and [ammeter](https://github.com/alexrothenberg/ammeter).

Thanks
------

This gem was based mostly on two different pieces of software: [bootstrap-generators](https://github.com/decioferreira/bootstrap-generators) and [rails-admin-scaffold](https://github.com/dhampik/rails-admin-scaffold)

I also took the liberty of copying kaminari bootstrap templates from [kaminari-bootstrap](https://github.com/mcasimir/kaminari-bootstrap)

TODO
----

Currently this gem is pretty much one-evening project, I'm not sure if I'll continue it's development past this point.

Things that'd be nice to have:

- support for anything more than Active Record
- ~~support for anything more than Erb (haml)~~
- support for slim
- namespace change support and more configuration options
- ~~kaminari/will_paginate support~~ 
- I liked the idea of copying the files to your project during install at first but now it just seems silly; I should probably rewrite everything from scratch to work more similarly to Devise, including the ability to extend default controllers where necessary
- I was also supposed to add Carrierwave support too but ran out of time
- sorting
- ~~per page count selector~~
