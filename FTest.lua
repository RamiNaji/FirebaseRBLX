local HttpService = game:GetService("HttpService");
local FirebaseService = require(script.Parent.FirebaseService);
local database = FirebaseService:GetFirebase("Time");

game.ReplicatedStorage.HasPremium.OnServerEvent:Connect(function(player)
	while wait(300) do
		local playerTime = database:GetAsync(player.UserId.."/Time");
		if playerTime ~= nil then
			player.Time.Value = playerTime + 1
			local TimePerPlayer = player.Time.Value
			database:SetAsync(player.UserId.."/Time", TimePerPlayer);
		else
			database:SetAsync(player.UserId.."/Time", 1);
			
			end
	end
end)


	
