# about nova-toolkit
<p align="center">
	<img src="https://raw.githubusercontent.com/ben8p/nova-toolkit/gh-pages/logo.png" title="nova" alt="nova"/>
</p>
With no frills nova-toolkit goes straight to the goal: facilitate your journey through your webapp's development.  
It is built around [typescript](http://www.typescriptlang.org/) technology to offer you the best experience and reduce the learning curve.  
Because the development is 100% test driven, every functionality is safe to use, regression issues are memories.  
With nova-toolkit we want to smooth your developer life so you can focus on your ultimate goal : building your product.

# environment support
- Chrome
- Firefox
- Internet explorer 10+
- NodeJs
- Safari (To be validated)

# features
- es6 feature provided by [typescript](http://www.typescriptlang.org/)
- XMLHTTPRequest supporing method GET, POST, PUT, DELETE (not in NodeJs)
- multiple class inheritance
- class linearization (based on [c3 Method Resolution Order](https://www.python.org/download/releases/2.3/mro/))
- [Object.assign](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign)
- Promise, respecting [the standards](https://developer.mozilla.org/en-US/docs/Mozilla/JavaScript_code_modules/Promise.jsm/Promise)
- Deferred: convenient helpers for dealing with Promise
- Publish/Subscribe pattern
- Dom events (not in NodeJs)
- feature detection
- string template substitution
- Array utils transposed to objects
- enhancement for browser Storages
- css injection
- debouncing and throttling
- observable data store
- ...a lot more

# development dependencies
- [nodejs](https://nodejs.org/), for all kind of things
- [npm](https://www.npmjs.com/), to install/update dependencies
- [typescript](http://www.typescriptlang.org/), to compile the code
- [intern](http://theintern.github.io/), to test the code
- [express](http://expressjs.com/), to spawn a test webserver
- [tslint](https://github.com/palantir/tslint), to lint the code
- [grunt](http://gruntjs.com/), to perform extra task like code minification
- [grunt-cli](https://github.com/gruntjs/grunt-cli), the command line runner for grunt
- [grunt-ts](https://github.com/TypeStrong/grunt-ts), to perform TypeScript transpilation from grunt
- [grunt-typedoc](https://github.com/TypeStrong/grunt-typedoc), to generate the documentation
- [grunt-express-server](https://github.com/ericclemmons/grunt-express-server), to run express web server from Grunt
- [grunt-contrib-watch](https://github.com/gruntjs/grunt-contrib-watch), to transpile .ts on save
- [grunt-open](https://github.com/jsoverson/grunt-open), to spwan the browser and go to the test url
- [grunt-contrib-clean](https://github.com/gruntjs/grunt-contrib-clean), to clean up all transpiled files
- [grunt-contrib-requirejs](https://github.com/gruntjs/grunt-contrib-requirejs), to release the toolkit
- [grunt-tslint](https://github.com/palantir/grunt-tslint), to lint the code from grunt

# getting started
- first of all, clone this git repository: ```git clone --recursive https://github.com/ben8p/nova-toolkit.git```
- from the project directory run ```npm install```. This will install all required dependencies.
- add intern TypeScript typings to the ```./node_modules/intern/``` folder (typings are not yet released with intern). You can get typings on [intern master branch](https://github.com/theintern/intern/tree/master/typings)
- run ```./node_modules/.bin/grunt default``` to transpile .ts files into .js

# run the tests
- run ```./node_modules/.bin/grunt dev```
- if you IDE support tranpilation on save use the following task: ```./node_modules/.bin/grunt dev:nowatch```
- a browser should open and load the url http://localhost:3000/node_modules/intern/client.html?config=tests/intern

You can also run the test in NodeJs with the following command: ```./node_modules/.bin/intern-client --config=tests/intern```  
Note: Some tests will be ignored

# note for windows users
You will have to add ".cmd" to every command:
- ```node_modules\.bin\grunt.cmd XXX```  
- ```node_modules\.bin\intern-client.cmd XXX```





# releasing
You can release the full toolkit by running the task ```./node_modules/.bin/grunt release```  
This will produce a single javascript file (~41kb) containing all nova modules.

# online documentation
Documentation can be found on GitHub page: http://ben8p.github.io/nova-toolkit/

# grunt tasks
grunt tasks can be run using the following command line: ```./node_modules/.bin/grunt NAME_OF_THE_TASK```  
replace ```NAME_OF_THE_TASK``` by one of the following:
- transpile => to transpile all .ts into .js
- doc => to generate documentation
- clean => delete all generated js files
- dev => start the test server (it will run until you kill the task), transpile all ts when a change is detected
- dev:nowatch => start the test server (it will run until you kill the task). No automatic transpilation.
- default => generate documentation and transpile all .ts into .js
- release => release the toolkit
- lint => to lint the code
if ```NAME_OF_THE_TASK``` is not provided, the default task will run.  

# contributing
Are you searching for new challenges ? You adhere on our vision ?  
We are just at the beginning of our adventure. It is the most exiting moment to join!  
Just clone the repository and go ahead : do your changes, send pull request, ...  
All contributors are welcomed!

# license
BSD 3-Clause License
Copyright (c) 2015, Benjamin Santalucia
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
