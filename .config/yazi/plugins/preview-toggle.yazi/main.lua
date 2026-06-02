--- @sync entry

local function entry(st, _)
	local r = rt.mgr.ratio
	if r.preview > 0 then
		st.saved = r.preview
		rt.mgr.ratio = { r.parent, r.current, 0 }
	else
		rt.mgr.ratio = { r.parent, r.current, st.saved or 4 }
	end
	ya.emit("app:resize", {})
end

return { entry = entry }
