local T, C, L, _ = unpack(select(2, ...))
if C.automation.auction_house_undercut ~= true then return end

----------------------------------------------------------------------------------------
--	Undercut auction house competitions by 1% (daftAuction by tonyis3l33t)
----------------------------------------------------------------------------------------
local daftAuction = CreateFrame("Frame", "daftAuction", UIParent)
daftAuction:RegisterEvent("ADDON_LOADED")
daftAuction:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
local selectedItem
local currentPage = 0
local myBuyoutPrice, myStartPrice
local myName = UnitName("player")

daftAuction:SetScript("OnEvent", function(self, event, addon)
	if event == "ADDON_LOADED" then -- do this when loaded
		if addon == "Blizzard_AuctionUI" then -- the auction house window opened
			AuctionsItemButton:HookScript("OnEvent", function(self, event)
				if event=="NEW_AUCTION_UPDATE" then -- user placed an item into auction item box
					self:SetScript("OnUpdate", nil)
					
					myBuyoutPrice = nil
					myStartPrice = nil
					currentPage = 0
					selectedItem = nil
				
					selectedItem, _, count, _, _, _, _, stackCount, totalCount = GetAuctionSellItemInfo()
					local canQuery = CanSendAuctionQuery()
					if canQuery == 1 and selectedItem then -- query auction house based on item name
						ResetCursor()
						QueryAuctionItems(selectedItem, 0, 0, 0, 0, 0, currentPage)
					end
				end
			end)
			daftAuction:UnregisterEvent("ADDON_LOADED")
		end
	elseif event == "AUCTION_ITEM_LIST_UPDATE" then -- the auction list was updated or sorted
		if (selectedItem ~= nil) then -- an item was placed in the auction item box
			local batch, totalAuctions = GetNumAuctionItems("list")
			local currentPageCount = floor(totalAuctions/50)
			
			for i=1, batch do
			local postedItem, _, count, _, _, _, _, minBid, _, buyoutPrice, _, _, _, owner = GetAuctionItemInfo("list",i)
				if postedItem == selectedItem and owner ~= myName then -- selected item matches the one found on auction list
					if myBuyoutPrice == nil and myStartPrice == nil then
						myBuyoutPrice = (buyoutPrice/count)*.99
						myStartPrice = (minBid/count)*.99
					else
						if myBuyoutPrice > (buyoutPrice/count) then
							myBuyoutPrice = (buyoutPrice/count)*.99
							myStartPrice = (minBid/count)*.99
						end
					end
				end
			end
			
			selectedItem = nil
			if currentPage < currentPageCount then -- finish searching other pages
				self:SetScript("OnUpdate", function(self, elapsed)
					if not self.timeSinceLastUpdate then 
						self.timeSinceLastUpdate = 0 
					end
					self.timeSinceLastUpdate = self.timeSinceLastUpdate + elapsed
					if self.timeSinceLastUpdate > .1 then -- a cycle has passed, run this
					selectedItem = GetAuctionSellItemInfo()
						local canQuery = CanSendAuctionQuery()
						if canQuery == 1 then -- check the next page of auctions
							currentPage = currentPage + 1
							QueryAuctionItems(selectedItem, 0, 0, 0, 0, 0, currentPage)
							self:SetScript("OnUpdate", nil)
						end
						self.timeSinceLastUpdate = 0
					end
				end)
			else -- all pages were scanned
				self:SetScript("OnUpdate", nil)

				local stackSize = AuctionsStackSizeEntry:GetNumber()
				if myStartPrice ~= nil then
					if stackSize > 1 then -- this is a stack of items
						if UIDropDownMenu_GetSelectedValue(PriceDropDown) == PRICE_TYPE_UNIT then -- input price per item
							MoneyInputFrame_SetCopper(StartPrice, myStartPrice)
							MoneyInputFrame_SetCopper(BuyoutPrice, myBuyoutPrice)
						else -- input price for entire stack
							MoneyInputFrame_SetCopper(StartPrice, myStartPrice*stackSize)
							MoneyInputFrame_SetCopper(BuyoutPrice, myBuyoutPrice*stackSize)
						end
					else -- this is not a stack
						MoneyInputFrame_SetCopper(StartPrice, myStartPrice) 
						MoneyInputFrame_SetCopper(BuyoutPrice, myBuyoutPrice)
					end
				end
				
				myBuyoutPrice = nil
				myStartPrice = nil
				currentPage = 0
				selectedItem = nil
			end
		end
	end
end)

-- Edit by Oz of shestakdotorg --
