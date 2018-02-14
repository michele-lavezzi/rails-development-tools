# RailsDevelopmentTools
This gem is .

## Usage
The gem has 3 main feature: routing info, partials info and messages.

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
Add 'helper RailsDevelopmentTools::ApplicationHelper' and 'include RailsDevelopmentTools' into the 'ApplicationController' of your application.

In the 'application.html.erb' add '<%= rails_development_tools_panel %>'. This is where the main panel is shown. This partial include the javascripts.

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
