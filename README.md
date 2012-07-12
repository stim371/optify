# Optify

## What is this?

Optify will be a gem providing Ruby bindings for the Optify API.

## What is Optify (the company)?

Optify calls itself "inbound marketing software", which includes tools for:

* SEO/SEM
* Social media campaigns
* Email marketing
* Sales enablement
* Visitor tracking and analytics
* Salesforce integration 

See more at optify.net

## Installation

When it's turned into a gem, you can install it with:

    gem install optify

If you're using Bundler, add it to your Gemfile:

    gem 'optify'

## Usage

You must have a token to access the Optify API, so first initialize a new instance of the Optify class to get started.

    @optify = Optify.new('token')

Now you can run your queries and parse the output.

## Output Options

* XML (default)
* JSON

## Methods

* sites - get all site information
* site by id - get information on a specific site based on its id
* visitors by site - get all visitor information for a specific site
* visitor by site and id - get visitor information for a specific visitor on a specific site

## Resources
http://help.optify.net/entries/20270158-introduction-to-optify-s-api
http://help.optify.net/forums/20157637-api

