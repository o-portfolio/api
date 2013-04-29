## API for O Portfolio.
[![Build Status](https://travis-ci.org/doctorsonrails/o_portfolio_api.png)](https://travis-ci.org/doctorsonrails/o_portfolio_api)

### Users

GET http://o-portfolio-api-2.herokuapp.com/authenticate
Returns 200: user_hash or 401

POST http://o-portfolio-api-2.herokuapp.com/users
Expects {first_name: "Foobar", last_name: "Foobar", email: "Foobar@foobar.com", password: "Foobar"}
GET http://o-portfolio-api-2.herokuapp.com/users/1
PUT http://o-portfolio-api-2.herokuapp.com/users/1


### Entries
```
GET http://o-portfolio-api-2.herokuapp.com/entries
POST http://o-portfolio-api-2.herokuapp.com/entries
GET http://o-portfolio-api-2.herokuapp.com/entries/1
PUT http://o-portfolio-api-2.herokuapp.com/entries/1
DELETE http://o-portfolio-api-2.herokuapp.com/entries/1
```
