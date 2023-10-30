local function update_tempo_filter()
    local speed = mp.get_property_number("speed")
    local audio_filter = mp.get_property("af")
    if speed ~= nil and speed ~= 1 and math.abs(speed - 1) < 0.6 then
        if not (string.find(audio_filter, "^scaletempo") or string.find(audio_filter, ",scaletempo")) then
            if audio_filter == "" then
                mp.set_property("af", "scaletempo")
            else
                mp.set_property("af", audio_filter .. ",scaletempo")
            end
        end
    elseif string.find(audio_filter, "^scaletempo") or string.find(audio_filter, ",scaletempo") then
        mp.set_property("af", string.gsub(audio_filter, "[,]?scaletempo", ""))
    end
end

mp.observe_property("speed", "number", update_tempo_filter)
