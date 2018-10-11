# Twitter_test 


Is an application that copies some of the functions of twitter:

- The users have the following fields: Nick, Email and Password. The email must be
a valid format and password have a minimum size of 6 characters
- Users can create comments, both new and in response to others. These
Comments will be a maximum of 140 characters.
- We will have a driver to view the comments, sorted by date
creation. Also, in order not to overload, it should be possible to page the results.

## Installation

### Characteristics

* Ruby 2.3.1
* Rails 5.2.1
* SQLite
* Rspec 3.8
* Boostrap v4.0


## Usage

```
$ git clone https://github.com/jorgeregidor/twitter_test
$ cd twitter_test

$ bundle install
$ rails db:create
$ rails db:migrate

```

## Run
```
$ rails s.
```
Open "localhost:3000"

## Test

```
$ bundle exec rspec.
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.