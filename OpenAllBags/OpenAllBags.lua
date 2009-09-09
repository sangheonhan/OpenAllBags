
-- Copyright (c) 2009, Sven Kirmess

local Version = 6
local Loaded = false

function OpenAllBags_OnEvent(event)

	 if ( event == "PLAYER_ENTERING_WORLD" ) then
		this:RegisterEvent("AUCTION_HOUSE_SHOW")
		this:RegisterEvent("AUCTION_HOUSE_CLOSED")
		this:RegisterEvent("BANKFRAME_OPENED")
		this:RegisterEvent("BANKFRAME_CLOSED")
		this:RegisterEvent("GUILDBANKFRAME_OPENED")
		this:RegisterEvent("GUILDBANKFRAME_CLOSED")
		this:RegisterEvent("MAIL_SHOW")
		this:RegisterEvent("MAIL_CLOSED")
		this:RegisterEvent("MERCHANT_SHOW")
		this:RegisterEvent("MERCHANT_CLOSED")
		this:RegisterEvent("TRADE_CLOSED")
		this:RegisterEvent("TRADE_SHOW")

		if ( not Loaded ) then
			DEFAULT_CHAT_FRAME:AddMessage(string.format("OpenAllBags %i loaded.", Version))
			Loaded = true
		end
	elseif ( event == "PLAYER_LEAVING_WORLD" ) then
		this:UnregisterEvent("AUCTION_HOUSE_SHOW")
		this:UnregisterEvent("AUCTION_HOUSE_CLOSED")
		this:UnregisterEvent("BANKFRAME_OPENED")
		this:UnregisterEvent("BANKFRAME_CLOSED")
		this:UnregisterEvent("GUILDBANKFRAME_OPENED")
		this:UnregisterEvent("GUILDBANKFRAME_CLOSED")
		this:UnregisterEvent("MAIL_SHOW")
		this:UnregisterEvent("MAIL_CLOSED")
		this:UnregisterEvent("MERCHANT_SHOW")
		this:UnregisterEvent("MERCHANT_CLOSED")
		this:UnregisterEvent("TRADE_CLOSED")
		this:UnregisterEvent("TRADE_SHOW")
	elseif (
		event == "AUCTION_HOUSE_SHOW" or
		event == "BANKFRAME_OPENED" or
		event == "GUILDBANKFRAME_OPENED" or
		event == "MAIL_SHOW" or
		event == "MERCHANT_SHOW" or
		event == "TRADE_SHOW"
	) then
		OpenAllBags(true)
	elseif (
		event == "AUCTION_HOUSE_CLOSED" or
		event == "BANKFRAME_CLOSED" or
		event == "GUILDBANKFRAME_CLOSED" or
		event == "MAIL_CLOSED" or
		event == "MERCHANT_CLOSED" or
		event == "TRADE_CLOSE"
	) then
		local i
		for i = 0, NUM_BAG_SLOTS do
			CloseBag(i)
		end
        end
end

