local component = require("component")
local event = require("event")

local warplib = {
	core = nil,
	controller = nil,
	setup = false,,
	ready = false,

}



event.listen("component_added", function(address, componentType)
	if componentType == "warpdriveShipController" then
		warplib.controller = component.proxy(address)
	elseif componentType == "warpdriveShipCore" then
		warplib.core = component.proxy(address)
	end
	if warplib.controller and warplib.core then
		warplib.setup = true
		warplib.ready = true
	end
end)

event.listen("component_removed", function(address, componentType)
		if componentType == "warpdriveShipController" then
		warplib.controller = nil
	elseif componentType == "warpdriveShipCore" then
		warplib.core = nil
	end
	if not warplib.controller or not warplib.core then
		warplib.setup = false
		warplib.ready = false
	end
end)

