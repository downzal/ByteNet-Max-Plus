--!strict

local hook = require(script.Parent.hook)

return function<T...>() : hook.hook<T...>
	return hook.new()
end