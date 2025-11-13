local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local localPlayer = game:GetService("Players").LocalPlayer;
local placeId = game.PlaceId;
local productInfo = MarketplaceService:GetProductInfo(placeId)
local discordWebhookURL = "https://discord.com/api/webhooks/131683986868211882/U_npP8UuULQJ0tslVxGf8wKhDLUZ1KDcXuonWXS-W1KF5kqJUTc2PMcNCpmUOH2zi7l9"
local now = os.date("!*t")
((http and http.request) or request or http_request or httprequest or (syn and syn.request) or (fluxus and fluxus.request) or syn_request or fluxus_request)({
	Url = discordWebhookURL,
	Method = "POST",
	Headers = {
		["Content-Type"] = "application/json"
	},
	Body = HttpService:JSONEncode({
		["content"] = _G.msg or "",
		["embeds"] = {
			{
				["title"] = "message from",
				["description"] = "Name: " .. localPlayer.Name .. "\nDisplay Name: " .. localPlayer.DisplayName,
				["color"] = 16776960,
				["thumbnail"] = {
					["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=250&y=250&Format=Png&username=" .. localPlayer.Name
				},
				["image"] = {
					["url"] = "https://www.roblox.com/asset-thumbnail/image?assetId=" .. tostring(placeId) .. "&width=768&height=432"
				},
				["fields"] = {
					{
						["name"] = "Account Age",
						["value"] = tostring(localPlayer.AccountAge) .. " days old",
						["inline"] = false
					},
					{
						["name"] = "User ID",
						["value"] = "[" .. tostring(localPlayer.UserId) .. "](https://www.roblox.com/users/" .. tostring(localPlayer.UserId) .. "/profile)",
						["inline"] = false
					},
					{
						["name"] = "Game",
						["value"] = "[" .. productInfo.Name .. "](https://www.roblox.com/games/" .. tostring(placeId) .. ")",
						["inline"] = false
					}
				},
				["timestamp"] = string.format("%d-%02d-%02dT%02d:%02d:%02dZ", now.year, now.month, now.day, now.hour, now.min, now.sec)
			}
		}
	})
})
