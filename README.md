# PubClient

THe pub_client gem is very minimal helper that will bring useful models from the Croucher publication system into another application.
Often all you need is to add:

    gem 'pub_client'

to your Gemfile and:

    include HasPage

to your model. As yet there are no endpoints here.


## API roadmap

Thanks to the abandonment of active_model_serializers, the Croucher APIs are in a slightly zombied condition. They will need to be rescued roughly this way:

* adopt the netflix fast_jsonapi library instead
* standardise on jsonapi
* discard the Her gem and find a better way to consume jsonapi resources.

One important purpose of this client gem is to make that transition invisible at the application level and allow us to migrate the applications one at a time.