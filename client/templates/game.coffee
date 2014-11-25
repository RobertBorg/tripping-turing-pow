Template.game.events = 
	'click button': (event, template)->
		template.game.connect()

Template.game.created = ->
	@game = new Game();

Template.game.rendered = ->
	console.log "rendered"
	@game.game.state.start 'boot'

Template.game.destroyed = ->
	@game.game.destroy()
