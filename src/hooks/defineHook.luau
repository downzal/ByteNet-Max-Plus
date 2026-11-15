--!strict

local hook = require(script.Parent.hook)

return function<T...>(props: { value: any }?): () -> hook.hook<T...>
	return function()
		return hook.new()
	end
end
