--[[

Shows the pause status and current time in the top-left corner while the video is paused, similar to when the 'o' key is pressed.

]]--


function pause_indicator(name, value)
    if value then
        mp.set_property_number("osd-level", 3)
    else mp.set_property_number("osd-level", 1)
    end
end


mp.observe_property("pause", "bool", pause_indicator)
