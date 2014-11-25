if Meteor.isServer
	@BinaryJS = Npm.require 'binaryjs'
	server = @BinaryJS.BinaryServer 
		port: 9000
	server.on 'error', (error)->
		console.log error
	server.on 'connection', (client)->
		console.log "client connected"
		client.on 'stream', (stream, meta)->
			console.log "new stream"
			console.log meta
			stream.on 'data', (data)->
				console.log "incomming data"
			stream.on 'pause', ->
				console.log "stream paused"
			stream.on 'resume', ->
				console.log "stream resumed"
			stream.on 'end', ->
				console.log "stream ended"
			stream.on 'close', ->
				console.log "stream closed"
			stream.on 'drain', ->
				console.log "stream drain"
			stream.on 'error', (error)->
				console.log error
		client.on 'error', (error)->
			console.log error
		client.on 'close', ->
			console.log "client connection closed"
		client.on 'open', ->
			console.log "client connection opened"

