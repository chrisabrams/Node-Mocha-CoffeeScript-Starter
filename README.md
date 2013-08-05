# Node, Mocha, CoffeeScript Starter
A simple example to test CoffeeScript server-side with Node.js and Mocha. Uses Chai and Expect.js.

## Getting Started
You will need Node.js to begin. Then:

    npm install

## To run tests

    cake test

## Test files

### Adding files
To add a new file to the test, place them in `test/unit` and name them `YOURFILENAME.coffee`. Mocha runs tests in alphabetical order of file name by default.

To decide what/where files should be included in the test, edit `test/helper.coffee`
