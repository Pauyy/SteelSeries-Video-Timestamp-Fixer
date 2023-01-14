content = io.popen("dir *.mp4 /b /a-d")
files = {}
i = 0
for line in content:lines() do
	i = i + 1
	files[i] = line
end
content:close()

--we have									  yyyy-mm-dd__hh-mm-ss
--we need								   	  mm/dd/yyyy hh:mm:ss
--powershell $(Get-Item *.mp4).creationtime= '01/11/1889 06:00:36'
function parseTime(time)
	local year = time:match("%d%d%d%d")
	local month = time:match("%d%d", 6)
	local day = time:match("%d%d", 8)
	local hour = time:match("%d%d", 13)
	local minute = time:match("%d%d", 15)
	local second = time:match("%d%d", 17)
	return os.date("'%m/%d/%Y %X'", os.time{year=year, month=month, day=day, hour=hour, min=minute, sec=second})
end

--Celeste__2022-03-13__22-56-06 
date_pattern = "%d%d%d%d%-%d%d%-%d%d__%d%d%-%d%d%-%d%d"
for _, f in ipairs(files) do
	local creationTime = parseTime(f:sub(f:find(date_pattern)))
	print("Processing " .. f)
	os.execute("powershell $(Get-Item "..f..").CreationTime=" .. creationTime)
	os.execute("powershell $(Get-Item "..f..").LastWriteTime=" .. creationTime)
end