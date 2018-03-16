# RailsDevelopmentTools
This gem is a set of tools that could speed up development of a Rails application.
These tools give you an insight of some of the main aspects of your application. All this wihout changing context directly in the browser.



## Usage
The gem has 3 main feature: routing info, partials info and messages.

ROUTING INFO
The routing panel shows the current action name, controller name and layout. This is helpful to quickly focus on the controller's action of the
current page. Useful mainly in the case the RESTful rules are not fully applied and the controller/action couple is not easy guessing from the url
ie. '/prices_computer' is routed to action 'search_by_category' in the 'product_controller'.

PARTIALS INFO
The partials info shows you the an overview of the partials file involved in the creation of the entire page.

MESSAGES
This is used to avoid the need to open (ie. 'tail -f development.log') the .log file to see what's going on.
You can set custom messages and see them directly on the screen.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_development_tools'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails_development_tools
```

## Changes in your application

Some little changes are required to make the tools available. The correct javacript should be loaded and the main panel has to be added
to the main layout.

### - application_controller.rb
Add the following lines to include the custom helpers and classes.
```ruby
class ApplicationController < ActionController::Base
  helper RailsDevelopmentTools::ApplicationHelper
  include RailsDevelopmentTools
  # ...
end
```
### - application.html.erb
To include the main panel to all of your pages add the following line. This helper load a partial that loads the javascript.
```ruby
<%= development_tools_panel %>
```

### - assets.rb
To make the javascripts available for loading include these lines:
```ruby
rails_development_tools/rails_development_tools.js
rails_development_tools/rails_development_tools_status.js
```
### - application.js
Add the following line
```ruby
//= require js.cookie
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
