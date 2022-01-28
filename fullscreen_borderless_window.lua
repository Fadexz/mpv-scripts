--[[

Allows for automatically setting up the window for wider than "16:9" video to be viewed across multiple monitors
side by side aligned to the left of the first monitor with excess video able to display on the second monitor,
useful if you want a larger video and don't mind bezels.
You can imagine this as displaying a video across multiple monitors but instead the video will be aligned to the
left (with no added "black bars"), and on multiple monitors with ease.

Note: The window border will be disabled and the window will be positioned in the top-left corner and at 100%
width of the screen. Due to probable mpv limitations, the window is not able to be set wider than the current
screen so you will need to drag the window larger manually until it fits the full height of the screens.
The script will still help you automate the rest of the setup.


16:9 = 1.778
Intended size: 0x100%+0+0 (limited to 100% width by mpv)


Test alt method to get current aspect not original, would need the script to run on size change
local ww, wh = mp.get_osd_size()
    if ww / wh >= 1.9

]]--


function fullscreen_borderless_window()
    if mp.get_property_number("video-aspect") >= 1.9 and mp.get_property_number("height") >= 720 then
        mp.set_property_native("border", false)
        mp.set_property("geometry", "100%+0+0")
    end
end


mp.register_event("file-loaded", fullscreen_borderless_window)
