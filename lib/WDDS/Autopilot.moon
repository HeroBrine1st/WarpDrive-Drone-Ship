import tools, warplib from require("WDDS/Core")
class Autopilot
	new: (mode,tX,tY,tZ) =>
		@target = {tX,tY,tZ}
		@mode = mode
	calculateJump: =>
		switch(@mode)
			when "wander"
				x,y,z = warplib.getPosition!
				deltaX = @target[1]-x
				deltaZ = @target[3]-z
				jumpdistance = warplib.getJumpDistance!
				
			when "landing"
