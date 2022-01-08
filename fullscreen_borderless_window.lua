function fullscreen_borderless_window()
    local ww, wh = mp.get_osd_size()
    if ww / wh > 1.9 and mp.get_property_number("height") >= 720 then  -- 16:9 = 1.78
        return
    end
    mp.set_property_native("border", false)
    mp.set_property("geometry", "100%+0+0")  -- intended use (but limited to 100% width): 0x100%+0+0
end


mp.register_event("file-loaded", fullscreen_borderless_window)
