class @BootState
	constructor: (@game) ->
		
	preload: ->
		@game.load.image('logo', '/logo.jpg');
	create: ->
		 @game.add.sprite(0, 0, 'logo');
	update: ->
		