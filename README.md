Admin Panel
===========

This gem has been created as a recruitment task I was given. It's a set of generators to create administration panel for your website.

Installation
------------

Start with adding these gems to your Gemfile:

```ruby
gem 'admin-panel', '~> 0.1.0'
gem 'devise', '~> 3.2'
gem 'simple_form', '~> 3.0'
gem 'bootstrap-sass', '~> 3.1'
```

Then do @bundle install@ and run the installer:

```bash
$ rails generate admin_panel:install
```

Using the scaffolder
--------------------

The scaffolder has basically the same params as the Rails one.

```bash
$ rails generate admin_panel:scaffold NAME 
```

Thanks
------

This gem was based mostly on two different pieces of software: [bootstrap-generators](https://github.com/decioferreira/bootstrap-generators) and [rails-admin-scaffold](https://github.com/dhampik/rails-admin-scaffold)

TODO
----

Currently this gem is pretty much one-evening project, I'm not sure if I'll continue it's development past this point.

Things that'd be nice to have:

- support for anything more than Active Record
- support for anything more than Erb (haml, slim)
- namespace change support and more configuration options
- I liked the idea of copying the files to your project at first but now it just seems silly; I should probably rewrite everything from scratch to work more similarly to Devise, including the ability to extend default controllers where necessary
- I was also supposed to add Carrierwave support too but ran out of time
