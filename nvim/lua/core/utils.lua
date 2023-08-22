local function merge_arrays(a, b)
	local ret = {}
	
	for _, v in ipairs(a) do
		table.insert(ret, v)
	end
	for _, v in ipairs(b) do
		table.insert(ret, v)
	end
	return ret
end

return {
	merge_arrays=merge_arrays,
}
