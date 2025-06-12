game.StarterGui:SetCore("SendNotification", {
				Title = "TNG-Loaded!",
				Icon = "rbxassetid://13699229918",
				Text = "YTB: TN Gaming"
			})
local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("ReGui") then
    return
end
local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()
local IDEModule = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/lib/ide.lua'))()
local TabSelector = ReGui:TabsWindow({
	Title = "TNG | Internal",
	Size = UDim2.new(0, 500, 0, 250),
    NoClose = true,
}):Center()
local EditorTab = TabSelector:CreateTab({
	Name = "Editor"
})
local CodeEditor = IDEModule.CodeFrame.new({
    Editable = true,
    FontSize = 13,
    Colors = SyntaxColors,
    FontFace = TextFont
})
ReGui:ApplyFlags({
	Object = CodeEditor.Gui,
	WindowClass = Window,
	Class = {
		--Border = true,
		Fill = true,
		Active = true,
		Parent = EditorTab:GetObject(),
		BackgroundTransparency = 1,
	}
})
CodeEditor:SetText("-- Welcome to TNG Internal Editor\nprint('Hello World')")
local Row = EditorTab:Row()
Row:Button({
	Text = "Execute",
	Callback = function()
        local text = CodeEditor:GetText()
		ExecuteScript(text)
	end,
})
Row:Button({
	Text = "Clean",
	Callback = function()
		CodeEditor:SetText("")
	end,
})
function ExecuteScript(code)
		local script = ""
		local luaCode = [[
			game.StarterGui:SetCore("SendNotification", {
				Title = "TNG-Exploit",
				Icon = "rbxassetid://13699229918",
				Text = "Execute Script"
			})
			identifyexecutor = function() 
				return "TNG" 
			end
			getexecutorname = function() return "TNG" end
		]]
		if string.find(code, "http.request\", \"http_request\"") then
			script = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/tngaming123/sd/refs/heads/main/UN.lua\"))()"
			loadstring(script)()
		else
			if string.find(code, "acsu123") then
				loadstring(code)()
			else
				local url = ExtractUrl(code)
				if url ~= nil and url ~= "" then
					if string.find(url, "https://api.luarmor.net") then
						script = luaCode .. code
						loadstring(script)()
					else
						local success, response = pcall(function()
							return game:HttpGet(url)
						end)
						
						if success then
							if string.find(response, "http.request\", \"http_request\"") then
								script = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/tngaming123/sd/refs/heads/main/UN.lua\"))()"
								loadstring(script)()
							else
								loadstring(luaCode .. response)()
							end
						else
							warn("Lỗi khi tải mã từ URL: " .. tostring(response))
						end
					end
				else
					loadstring(luaCode .. code)()
				end
			end
		end
	end
	
	function ExtractUrl(inputCode)
		local urlStart, _ = string.find(inputCode, "game:HttpGet%(")
		if urlStart then
			local url = string.match(inputCode, "game:HttpGet%(%\"(.-)%\"")
			return url
		end
		return nil
	end
    local redGuiFolder = game:GetService("CoreGui"):WaitForChild("ReGui")
for _, gu in ipairs(redGuiFolder:GetChildren()) do
    if gu:IsA("ScreenGui") and gu.Name == "Windows" then
        gu.Enabled = false
    end
end
local isWindowVisible = false
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Seven then
        isWindowVisible = not isWindowVisible
        for _, gu in ipairs(redGuiFolder:GetChildren()) do
            if gu:IsA("ScreenGui") and gu.Name == "Windows" then
                gu.Enabled = isWindowVisible
            end
        end
    end
end)