# Optify

A gem providing Ruby bindings for the [Optify API](http://help.optify.net/forums/20157637-api).

__NOTE:__ Optify has [shut down](http://www.geekwire.com/2013/optify-hits-wall-lays-staff/), so no further development will be completed on this library.

## What is Optify (the company)?

Optify calls itself "inbound marketing software", which includes tools for:

* SEO/SEM
* Social media campaigns
* Email marketing
* Sales enablement
* Visitor tracking and analytics
* Salesforce integration 

See more at [optify.net](http://optify.net)

## Installation

When it's turned into a gem, you can install it with:

    gem install optify

If you're using Bundler, add it to your Gemfile:

```ruby
gem 'optify'
```

## Methods

* _**all_sites**_ - get all site information
* _**site**_ - get information on a specific site based on its id
* _**all_visitors**_ - get all visitor information for a specific site
* _**visitor**_ - get visitor information for a specific visitor on a specific site

## Usage

You must have a token to access the Optify API, so first initialize a new instance of the Optify class to get started.

```ruby
@optify = Optify.new('token')
```

Now you can run your queries and parse the output.

```ruby
@optify.all_sites    #=> array of all sites

@optify.site(123455) #=> details for site with id 123455

@optify.all_visitors(123455, { :start_date => '2012-10-04', :end_date => '2012-10-14' })
  #=> visitor data for specific site between those days. An example of how to use the options hash.
```

## Volume Requests

If you have a large data request (say a site with millions of visits per month), take a look at Optify's 'Best Practices' document.

* http://help.optify.net/entries/21771626-api-large-volume-best-practices

## Resources
* http://help.optify.net/entries/20270158-introduction-to-optify-s-api
* http://help.optify.net/forums/20157637-api

