
local def = {
	image = "robot_goal",
	goalFunc = function (other)
		if other.GetType() == "basic_robot" and other.HasArrived() then
			return true
		end
	end,
}

return def