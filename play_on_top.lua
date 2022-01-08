--[[

Sets the window piority to on top when the video is playing and disables it when the video is paused, useful for multitasking while watching a video.

]]--


function pause_indicator(name, value)
    if value then
        mp.set_property_bool("ontop", false)
    else mp.set_property_bool("ontop", true)
    end
end


mp.observe_property("pause", "bool", pause_indicator)
