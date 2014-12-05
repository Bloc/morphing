# Morphing

Morphing is a Rails engine that allows you to morph into your users temporarily. This can be especially helpful when debugging issues reported by a user without needing to log into their account to reproduce.

NOTE: This library assumes you're using devise.

## Usage

Add the following to your Gemfile:

```ruby
gem 'morphing'
```

and be sure to ```bundle install``` and add to your routes:

```ruby
YourApplication::Application.routes.draw do
  ...
  morphing_for
  ...
end
```

To use the ```morphed?``` helper, Add the following to your ```app/helpers/application_helper.rb```:

```ruby
module ApplicationHelper
  include Morphing::ApplicationHelper
end
```

Then place a link somewhere only admins can see:

```
= link_to "Morph", morph_path(@user)
```

If you're morphed, you can provide a link to unmorph:

```haml
- if morphed?
  = link_to "Unmorph", unmorph_path
```

We recommend making this a big red banner that makes it clear you're morphed! (Future releases will have this included.)

## Customizing controller behavior

If you want to customize the behavior of the controller, for example to add or skip before filters, or to perform authorization, just subclass the MorphingController somewhere in your application:

```ruby
class MorphingController < Morphing::MorphingController
  authenticate_user! only: [:morph]
end
```

Then, pass that controller as an argument to the routes helper:

```ruby
YourApplication::Application.routes.draw do
  ...
  morphing_for controller: 'morphing'
  ...
end
```

## Sponsor

This project is sponsored by the engineering team at [Bloc](https://www.bloc.io).
