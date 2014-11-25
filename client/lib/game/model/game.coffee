g = @
class @Game
	game: null
	serverSocket: null
	constructor: ->
		@game = new g.Phaser.Game(800, 400, Phaser.AUTO, 'test', null, true, false);
		@game.state.add 'boot', new BootState(@game)
		Session.setTemp 'connectionState', 'disconnected'
	connect: (serverAddr) ->
		that = @
		Protocol = g.dcodeIO.ProtoBuf.loadProtoFile("/protocol/handshake1.proto").build("Game")
		console.log Protocol
		Session.set 'connectionState', 'connecting'
		@serverSocket = new BinaryClient 'ws://localhost:9000'
		@serverSocket.on 'error', (error)->
			console.log error
			Session.set 'connectionState', 'error'
		@serverSocket.on 'close', ->
			Session.set 'connectionState', 'disconnected'
		@serverSocket.on 'open', ->
			Session.set 'connectionState', 'connected'
			console.log "new stream"
			stream = that.serverSocket.createStream 
				dumma: "linkan"
			# Got new data
			stream.on 'data', (data)->
				#parse data
				console.log "incoming data"
			stream.on 'end', ->
				console.log "server disconnected"


