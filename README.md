## API for O Portfolio.
[![Build Status](https://travis-ci.org/o-portfolio/api.png)](https://travis-ci.org/o-portfolio/api)
[![Dependencies](https://gemnasium.com/o-portfolio/api.png?travis)](https://gemnasium.com/o-portfolio/api)
[![Code Climate](https://codeclimate.com/github/o-portfolio/api.png)](https://codeclimate.com/github/o-portfolio/api)

### Users
```
GET http://o-portfolio-api-2.herokuapp.com/authenticate
Returns 200: user_hash or 401

POST http://o-portfolio-api-2.herokuapp.com/users
Expects {first_name: "Foobar", last_name: "Foobar", email: "Foobar@foobar.com", password: "Foobar"}
GET http://o-portfolio-api-2.herokuapp.com/users/1
PUT http://o-portfolio-api-2.herokuapp.com/users/1
```

### Entries
```
GET http://o-portfolio-api-2.herokuapp.com/entries
POST http://o-portfolio-api-2.herokuapp.com/entries
GET http://o-portfolio-api-2.herokuapp.com/entries/1
PUT http://o-portfolio-api-2.herokuapp.com/entries/1
DELETE http://o-portfolio-api-2.herokuapp.com/entries/1
```
 
## Licence
Copyright © 2013, oPortfolio Team. oPortfolio is developed and maintained by [Jeremy Walker](http://www.ihid.co.uk) and [Ed Wallitt](http://thecodingdoc.com). It is supported by [Meducation](https://www.meducation.net), [Podmedics](http://kaizen-ursus.com/), and [Doctors on     Rails](http://www.doctorsonrails.org). It is released under the open [MIT Licence](http://opensource.org/licenses/MIT).
