Prostats-Backend
================
This rails server supplies an API for the Ember.js-based frontend. In service to the frontend application, it creates a database, harvests the relevant data to fill it, and supplies a JSON API.

## Requirements

* Ruby 2.1+(created on 2.2.2p95)
* Postgres 9.3+

## Installation

Start with cloning the project.

```bash
git clone https://github.com/bravely/prostats-backend.git
```

Install relevant gems:

```bash
bundle install
```

And lastly, create the DB and load the schema.

```bash
rake db:create
rake db:setup
```

## Usage

This project primarily uses the [Passenger](https://www.phusionpassenger.com/) server.
 If you'd like to start the server, from inside of its directory,
 simply enter:

 ```bash
bundle exec passenger start
 ```

If you'd rather start Guard and run the test suite,
```bash
bundle exec guard
```

### Notes

Currently, the **lib/tasks/lolesports_api.rake** file is in MVP-mode. In
the future, it'll be ported over to be mostly managed by Redis-backed
Sidekiq jobs. It pulls in everything necessary data as it exists currently,
but won't pull in each League automatically, and is limited in updating
in-progress games.

However, you can still use it currently to load your database with
suitable data:

```bash
rake lolesports_api:process_league[1]
```

Will harvest all of the NA LCS. If you're looking for any specific League,
use the suitable `id` below:

|League       | id |
|=============|====|
|NA LCS       |1   |
|EU LCS       |2   |
|All Star     |3   |
|Worlds       |4   |
|NA Challenger|6   |
|EU Challenger|7   |
|LCK Korea    |8   |
|LPL China    |9   |
|Int. Wildcard|11  |
|LMS Taiwan   |12  |
|MSI          |14  |
