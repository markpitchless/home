--
-- Notion dock module configuration
--

-- Create a dock
mod_dock.create{
    -- Dock mode: embedded|floating
    -- mda: embedded will fail if the built in status bar is on.
    -- Err: "Screen 0 already has an stdisp. Refusing to add embedded dock"
    -- Can comment ext_statusbar in cfg_ion.lua.
    -- http://comments.gmane.org/gmane.comp.window-managers.ion.general/5196
    mode="embedded",
    --mode="floating",
    -- The screen to create the dock on
    screen=1,
    --screen=2,
    -- Corner or side of the screen to place the dock on.
    -- For embedded dock the valid values are: tl|tr|bl|br
    -- For floating dock the following are also valid: tc|bc|ml|mc|mr
    -- We create a dock dowwn the left side to house gkrellm :)
    pos="tl",
    -- Growth direction: left|right|up|down
    grow="down",
    -- Whether new dockapps should be added automatically to this dock
    is_auto=true,
    -- Show floating dock initially?
    floating_hidden=false,
    -- Name of the dock
    name="*dock*",
}


-- For floating docks, you may want the following toggle binding.
defbindings("WScreen", {
    bdoc("Toggle floating dock."),
    kpress(META.."D", "mod_dock.set_floating_shown_on(_, 'toggle')")
})


-- Dock settings menu. For this to work, mod_menu must have been loaded
-- previously.
if mod_menu then
    defmenu("dock-settings", {
        menuentry("Pos-TL", "_:set{pos='tl'}"),
        menuentry("Pos-TR", "_:set{pos='tr'}"),
        menuentry("Pos-BL", "_:set{pos='bl'}"),
        menuentry("Pos-BR", "_:set{pos='br'}"),
        menuentry("Grow-L", "_:set{grow='left'}"),
        menuentry("Grow-R", "_:set{grow='right'}"),
        menuentry("Grow-U", "_:set{grow='up'}"),
        menuentry("Grow-D", "_:set{grow='down'}"),
    })

    defbindings("WDock", {
        mpress("Button3", "mod_menu.pmenu(_, _sub, 'dock-settings')"),
    })
end

