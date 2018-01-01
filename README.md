# Thinreports Rails5 Example

[![Build Status](https://travis-ci.org/thinreports/thinreports-rails5-example.svg?branch=master)](https://travis-ci.org/thinreports/thinreports-rails5-example)

The Simple Task Management Application using Thinreports and Rails5.
Rails4 example is [here](https://github.com/thinreports/thinreports-rails4-example).

## How to run this example:

Get this application source using git:

    $ git clone git://github.com/thinreports/thinreports-rails5-example.git

Or download ZIP/TAR archives from [here](https://github.com/thinreports/thinreports-rails5-example/archive/master.zip).

Then move to application directory, and bundle:

    $ cd thinreports-rails5-example/
    $ bundle install

Setup database with seeds:

    $ bundle exec rake db:setup

Start application:

    $ bundle exec rails s

Go to `http://localhost:3000/tasks` in your browser.

## Development

### Requirements

* Ruby 2.2. 2.3, 2.4, 2.5
* Rails 5.1.4
* thinreports 0.10.0
* thinreports-rails 0.4.0

## Appendix: Run on Docker Container (Experimental)

```
$ docker-compose build
$ docker-compose run rails rails db:setup
$ docker-compose up -d
```

Open `http://localhost:3000`.

## Copyright

&copy; 2010-2016 [Matsukei Co.,Ltd](http://www.matsukei.co.jp).
