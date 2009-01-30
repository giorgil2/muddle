= Muddle

== DESCRIPTION:
A tumblelog running on merb and datamapper, with user data in mysql and post data in couchdb.  
Currently in active use on http://geemus.com.

== SETUP:

* Download and setup all dependencies.
* Create mysql database 
  > mysql -u username
  > create database muddle_development;
* Create couch database 
  > curl -X PUT localhost:5984/muddle_development
* Run interactive console 
  > merb -i
* Migrate users 
  > User.auto_migrate!
* Create a user account 
  > User.create(:email => 'example@example.com', :password => 'password', :password_confirmation => 'password')
* Persist post views to couch
  > Post.auto_migrate!
* Exit interactive
  > exit
* Start merb
  > merb
* Home at: http://localhost:4000/
* Login at: http://localhost:4000/login

== REQUIREMENTS:

* See config/dependencies.rb

== INSTALL:

* git clone git@github.com/geemus/muddle.git

== LICENSE:

(The MIT License)

Copyright (c) 2008 geemus(Wesley Beary) => me@geemus.com

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
