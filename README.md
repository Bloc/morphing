# Morphing

Morphing is a Rails engine that allows you to morph into your users temporarily. This can be especially helpful when debugging issues reported by a user without needing to log into their account to reproduce.

NOTE: This library assumes you're using devise.

## Installation

Add the following to your Gemfile:

```ruby
gem 'morphing'
```

and be sure to ```bundle install```.

Add the following to your ```app/helpers/application_helper.rb```:

```ruby
module ApplicationHelper
  include Morphing::ApplicationHelper
end
```


Then place a link somewhere only admins can see:

```
= link_to "Morph", morphing.morph_path(@user)
```

If you're morphed, you can provide a link to unmorph:

```haml
- if morphed?
  = link_to "Unmorph", morphing.unmorph_path
```

## Overriding controller behavior

If you want to, for example, alter behavior of the controller, Rails recommends either ```Class#eval``` or ```ActiveSupport::Concern```. For more info, see [Configuring an Engine](http://guides.rubyonrails.org/engines.html#configuring-an-engine). Here's an example:

```
Morphing::MorphingController.class_eval do
  authenticate_user! only: [:morph]
end
```

## Sponsor

This project is sponsored by the engineering team at [Bloc](https://www.bloc.io).
