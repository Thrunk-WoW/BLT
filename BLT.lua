--Made with Help from the 'For WoW Community' First steps guide
local frame = CreateFrame('FRAME')
frame:SetPoint('CENTER', -255, -231)
frame:SetWidth(60) --28?
frame:SetHeight(60)
frame:RegisterEvent('CHAT_MSG_SPELL_AURA_GONE_SELF')
frame:SetScript('OnEvent', function()
    if arg1 == 'Bloodlust fades from you.' then
        frame:SetAlpha(0.8)
		frame.texture:Show()
		frame.title:Show()
        ShowTimer(280, frame.title)
    end
end)

frame.texture = frame:CreateTexture(nil, 'ARTWORK')
frame.texture:SetTexture('Interface\\Icons\\Spell_Nature_BloodLust')
frame.texture:SetPoint('LEFT', frame, 'LEFT')
frame.texture:SetWidth(28)
frame.texture:SetHeight(28)
frame.texture:Hide()

frame.title = frame:CreateFontString(nil, 'OVERLAY')
frame.title:SetFont("Fonts\\ARIALN.TTF",12,"OUTLINE") 
frame.title:SetTextColor(1,1,1,1)
frame.title:SetPoint('CENTER', frame.texture, 'CENTER', 0, 0)
frame.title:SetText('')
frame.title:Hide()

function ShowTimer(duration, string)
    local timer = CreateFrame('FRAME')
    timer.start = GetTime()
    timer.duration = duration
    timer.sec = 0
    timer:SetScript('OnUpdate', function()
        if GetTime() >= (this.start + this.sec) then
            this.sec = this.sec + 1
            if this.sec <= duration then
                string:SetText(this.duration - this.sec)
            else
                string:Hide()
				frame.texture:Hide()
                this:SetScript('OnUpdate', nil)
            end
        end
    end)
    string:SetText(duration)
    string:Show()
end
