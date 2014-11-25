if Meteor.isClient
  ->

###
  Template.hello.helpers
    counter: ->
      Session.get "counter"
### 

### 
  Template.hello.events
    'click button': ->
      # increment the counter when button is clicked
      Session.set "counter", Session.get("counter") + 1
###

if Meteor.isServer
  Meteor.startup ->
    # do setup
