local instance = {}

function instance.new(classname_string)
	local proxy = newproxy(true)
	local self = getmetatable(proxy)
	local Inst = {}
	Inst._instance = Instance.new(classname_string)
	Inst.ClassName = classname_string
	self.__index = Inst._instance
	self.__metatable = false
	
	
	self.__newindex = function(self0, key, value)
		if self0._instance[key] then
			return self0._instance[key]
		else
			return nil
		end
	end
	-- Custom Instance Methods
	-- BasePart Methods
	function Inst:Anchor()
		pcall(function()
			if self._instance.Anchored then
				self._instance.Anchored = true
			end
		end)
	end
	function Inst:UnAnchor()
		pcall(function()
			if self._instance.Anchored then
				self._instance.Anchored = false
			end
		end)
	end
	function Inst:SetName(name_string)
		if name_string then
			self._instance.Name = name_string
		end
	end
	function Inst:SetPosition(position_vector3)
		if position_vector3 then
			if self._instance:IsA('BasePart') then
				self._instance.Position = position_vector3
			end
		end
	end
	function Inst:SetProperty(property_string, value_any)
		pcall(function()
			self._instance[property_string] = value_any
		end, property_string, value_any)
	end
	-- GuiObjects Methods
	function Inst:SetSize(size_udim2)
		if size_udim2 and self._instance:IsA('GuiObject') then
			self._instance.Size = size_udim2
		end
	end
	function Inst:SetPosition(position_udim2)
		if position_udim2 and self._instance:IsA('GuiObject') then
			self._instance.Size = position_udim2
		end
	end
	function Inst:SetTransparency(transparency_number)
		if transparency_number and self._instance:IsA('GuiObject') then
			self._instance.Transparency = transparency_number
		end
	end
	Inst.Name = Inst._instance.Name
	return setmetatable(Inst, self)
end

return instance