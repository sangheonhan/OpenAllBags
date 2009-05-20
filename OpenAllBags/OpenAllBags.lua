
local OpenAllBags_Version = 1
local OpenAllBags_loaded = false



function OpenAllBags_OpenAllBankBags()

	local i

        for i = NUM_BAG_SLOTS, (NUM_BAG_SLOTS + NUM_BANKBAGSLOTS) do
                OpenBag(i)
        end
end



function OpenAllBags_OnEvent(event)

	 if ( event == "PLAYER_ENTERING_WORLD" ) then
		this:RegisterEvent("AUCTION_HOUSE_SHOW")
		this:RegisterEvent("AUCTION_HOUSE_CLOSED")
		this:RegisterEvent("BANKFRAME_OPENED")
		this:RegisterEvent("BANKFRAME_CLOSED")
		this:RegisterEvent("MAIL_SHOW")
		this:RegisterEvent("MAIL_CLOSED")
		this:RegisterEvent("MERCHANT_SHOW")
		this:RegisterEvent("MERCHANT_CLOSED")
		this:RegisterEvent("TRADE_CLOSED")
		this:RegisterEvent("TRADE_SHOW")
		
		if (not OpenAllBags_loaded) then
			DEFAULT_CHAT_FRAME:AddMessage(string.format("OpenAllBags %i loaded.", OpenAllBags_Version))
			OpenAllBags_loaded = true
		end
	elseif ( event == "PLAYER_LEAVING_WORLD" ) then
		this:UnregisterEvent("AUCTION_HOUSE_SHOW")
		this:UnregisterEvent("AUCTION_HOUSE_CLOSED")
		this:UnregisterEvent("BANKFRAME_OPENED")
		this:UnregisterEvent("BANKFRAME_CLOSED")
		this:UnregisterEvent("MAIL_SHOW")
		this:UnregisterEvent("MAIL_CLOSED")
		this:UnregisterEvent("MERCHANT_SHOW")
		this:UnregisterEvent("MERCHANT_CLOSED")
		this:UnregisterEvent("TRADE_CLOSED")
		this:UnregisterEvent("TRADE_SHOW")
	elseif (
		event == "AUCTION_HOUSE_SHOW" or
		event == "BANKFRAME_OPENED" or
		event == "MAIL_SHOW" or
		event == "MERCHANT_SHOW" or
		event == "TRADE_SHOW"
	) then
		OpenAllBags(true)
	elseif ( event == "BANKFRAME_OPENED" ) then
                OpenBankBagFrames(true)
	elseif (
		event == "AUCTION_HOUSE_CLOSED" or
		event == "BANKFRAME_CLOSED" or
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

