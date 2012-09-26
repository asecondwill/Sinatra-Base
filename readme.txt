# Sample Sinatra App 

This is a sample sinatra app to run micro sites.  These typically have a registration type form.  A little form with persistence is included. 

Sass is just being compiled locally using the command line thing. 

TODO:  add coffee script.

to start localy: 
------------------------------------
shotgun app.rb (http://127.0.0.1:9393/)
OR  ruby app.rb (http://localhost:4567)


To view DB stuff in irb
-----------------------------------
IRB
require './app.rb'
require 'hirb'
Hirb.enable
eg - Person.all


Sass
--------------
ls to stylesheets and
scss --watch scss:css