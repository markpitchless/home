
-- Notion main configuration file
--
-- This file only includes some settings that are rather frequently altered.
-- The rest of the settings are in cfg_notioncore.lua and individual modules'
-- configuration files (cfg_modulename.lua). 
--
-- When any binding and other customisations that you want are minor, it is 
-- recommended that you include them in a copy of this file in ~/.notion/.
-- Simply create or copy the relevant settings at the end of this file (from
-- the other files), recalling that a key can be unbound by passing 'nil' 
-- (without the quotes) as the callback. For more information, please see 
-- the Notion configuration manual available from the Notion Web page.
--

-- Set default modifiers. Alt should usually be mapped to Mod1 on
-- XFree86-based systems. The flying window keys are probably Mod3
-- or Mod4; see the output of 'xmodmap'.
META="Mod4+"
-- Give the F keys back to apps
ALTMETA="Mod4+"
-- Give the alt key a name
ALT="Mod1+"

-- Terminal emulator
--XTERM="gnome-terminal"
XTERM="xfce4-terminal"

-- Some more shell commands. --mda
XBROWSER="firefox"
XLOCK_SCREEN="xscreensaver-command -lock"

-- Some basic settings
ioncore.set{
    -- Maximum delay between clicks in milliseconds to be considered a
    -- double click.
    --dblclick_delay=250,

    -- For keyboard resize, time (in milliseconds) to wait after latest
    -- key press before automatically leaving resize mode (and doing
    -- the resize in case of non-opaque move).
    --kbresize_delay=1500,

    -- Opaque resize?
    --opaque_resize=false,
    opaque_resize=true,

    -- Movement commands warp the pointer to frames instead of just
    -- changing focus. Enabled by default.
    warp=true,
    
    -- Switch frames to display newly mapped windows
    --switchto=true,
    
    -- Default index for windows in frames: one of 'last', 'next' (for
    -- after current), or 'next-act' (for after current and anything with
    -- activity right after it).
    --frame_default_index='next',
    
    -- Auto-unsqueeze transients/menus/queries.
    --unsqueeze=true,
    
    -- Display notification tooltips for activity on hidden workspace.
    screen_notify=true,
}

-- mda: load the xinirama plugin
-- XXX Must do this BEFORE loading mod_statusbar
dopath("mod_xinerama")

-- Load default settings. The file cfg_defaults loads all the files
-- commented out below, except mod_dock. If you do not want to load
-- something, comment out this line, and uncomment the lines corresponding
-- the the modules or configuration files that you want, below.
-- The modules' configuration files correspond to the names of the 
-- modules with 'mod' replaced by 'cfg'.
--dopath("cfg_defaults")

-- Load configuration of the Notion 'core'. Most bindings are here.
dopath("cfg_notioncore")

-- Load some kludges to make apps behave better.
dopath("cfg_kludges")

-- Define some layouts. 
dopath("cfg_layouts")

-- Load some modules. Bindings and other configuration specific to modules
-- are in the files cfg_modulename.lua.
dopath("mod_query")
dopath("mod_menu")
dopath("mod_tiling")
--Allow dock to run embedded. See cfg_dock.lua
--Note cant have embedded dock and status bar
--dopath("mod_statusbar")
dopath("mod_dock")
dopath("mod_sp")


--
-- Common customisations
--

-- Uncommenting the following lines should get you plain-old-menus instead
-- of query-menus.

defbindings("WScreen", {
    kpress(ALTMETA.."F12", "mod_menu.menu(_, _sub, 'mainmenu', {big=true})"),
})

defbindings("WMPlex.toplevel", {
    kpress(META.."M", "mod_menu.menu(_, _sub, 'ctxmenu')"),
})


--
-- Key bindings
--
-- See /usr/local/etc/notion/cfg_notioncore.lua for the defaults.

-- WScreen context bindings
-- The bindings in this context are available all the time.
defbindings("WScreen", {
    -- Workspaces, full screen client window
    -- META+., META+. still active
    bdoc("Switch to next/previous object (Workspaces, full screen client window) within current screen."),
    kpress(META.."Control+Right", "WScreen.switch_prev(_)"),
    kpress(META.."Control+Left", "WScreen.switch_next(_)"),

    -- Should we unbind the old?
    bdoc("Go to n:th screen on multihead setup."),
    kpress(META..ALT.."1", "ioncore.goto_nth_screen(0)"),
    kpress(META..ALT.."2", "ioncore.goto_nth_screen(1)"),
    kpress(META..ALT.."3", "ioncore.goto_nth_screen(2)"),
    kpress(META..ALT.."4", "ioncore.goto_nth_screen(3)"),
    kpress(META..ALT.."5", "ioncore.goto_nth_screen(4)"),
    kpress(META..ALT.."6", "ioncore.goto_nth_screen(5)"),
    -- Should we unbind the old?
    bdoc("Go to next/previous screen on multihead setup."),
    kpress(META..ALT.."Left", "ioncore.goto_prev_screen()"),
    kpress(META..ALT.."Right", "ioncore.goto_next_screen()"),
})

-- Frames for transient windows ignore this bindmap
defbindings("WMPlex.toplevel", {
    -- We unbind the F keys by setting ALTMETA, then fix up here
    kpress(ALTMETA.."F1", nil), -- man pages
    kpress(ALTMETA.."F2", nil), -- term
    kpress(ALTMETA.."F3", nil), -- run command
    kpress(META.."F3", nil),    -- lua code to run

    bdoc("Query for manual page to be displayed."),
    kpress(META.."F1", "mod_query.query_man(_, ':man')"),

    bdoc("Query for command line to execute."),
    kpress(META.."F2", "mod_query.query_exec(_)"),

    bdoc("Query for Lua code to execute."),
    kpress(META.."F3", "mod_query.query_lua(_)"),

    -- Then add some nicer app launchers
    bdoc("Run a terminal emulator."),
    kpress(META.."T", "ioncore.exec_on(_, XTERM or 'xterm')"),

    bdoc("Run a web browser."),
    kpress(META.."W", "ioncore.exec_on(_, XBROWSER or 'firefox')"),

    bdoc("Lock screen."),
    kpress(META.."L", "ioncore.exec_on(_, XLOCK_SCREEN or 'xlock')"),
})

defbindings("WFrame.toplevel", {
    bdoc("Query for a client window to attach."),
    kpress(META.."A", "mod_query.query_attachclient(_)"),

    -- Tabs!
    bdoc("Switch to next/previous object within the frame."),
    kpress(META.."Page_Down", "WFrame.switch_next(_)"),
    kpress(META.."Page_Up", "WFrame.switch_prev(_)"),
    bdoc("Move current object within the frame left/right."),
    kpress(META.."Shift+Page_Down", "WFrame.dec_index(_, _sub)", "_sub:non-nil"),
    kpress(META.."Shift+Page_Up", "WFrame.inc_index(_, _sub)", "_sub:non-nil"),

    bdoc("Maximize the frame horizontally/vertically."),
    kpress(META.."H", "WFrame.maximize_horiz(_)"),
    kpress(META.."V", "WFrame.maximize_vert(_)"),
})


-- Bindings for the tilings. 
-- cfg_tiling.lua
defbindings("WTiling", {
    bdoc("Split current frame vertically."),
    kpress(META.."S", "WTiling.split_at(_, _sub, 'bottom', true)"),
    bdoc("Split current frame horizontally."),
    kpress(META.."Shift+S", "WTiling.split_at(_, _sub, 'right', true)"),

    bdoc("Flip tiling."),
    kpress(META.."F", "WTiling.flip_at(_, _sub)"),

    bdoc("Go to frame above/below/right/left of current frame."),
    --kpress(META.."P", "ioncore.goto_next(_sub, 'up', {no_ascend=_})"),
    --kpress(META.."N", "ioncore.goto_next(_sub, 'down', {no_ascend=_})"),
    --kpress(META.."Tab", "ioncore.goto_next(_sub, 'right')"),
    kpress(META.."Up", "ioncore.goto_next(_sub, 'up', {no_ascend=_})"),
    kpress(META.."Down", "ioncore.goto_next(_sub, 'down', {no_ascend=_})"),
    kpress(META.."Right", "ioncore.goto_next(_sub, 'right')"),
    kpress(META.."Left", "ioncore.goto_next(_sub, 'left')"),
    submap(META.."K", {
        --kpress("Tab", "ioncore.goto_next(_sub, 'left')"),

        --bdoc("Split current frame horizontally."),
        --kpress("S", "WTiling.split_at(_, _sub, 'right', true)"),

        bdoc("Destroy current frame."),
        kpress("X", "WTiling.unsplit_at(_, _sub)"),
    }),
})


-- Ion mod_sp configuration file
-- cfg_sp.lua

defbindings("WScreen", {
    -- Unbind default to free up Mod4+space for gnome-do
    kpress(META.."space", nil),

    -- Key left of 1. NB: This is not portable accross different keyboards. See
    -- cfg_sp.lua for details
    bdoc("Toggle scratchpad."),
    kpress(META.."grave", "mod_sp.set_shown_on(_, 'toggle')"),
})




--
-- WinProps - Map apps to specific frames etc
--
-- http://sourceforge.net/apps/mediawiki/notion/index.php?title=Tour#Specifying_that_a_certain_program_should_always_be_in_a_certain_frame
-- http://notion.sourceforge.net/notionconf/node4.html#SECTION00450000000000000000

-- Make noify messages less annoying
defwinprop {
    class    = "Xfce4-notifyd",
    instance = "xfce4-notifyd",
    float = true,
    transparent = true,
    jumpto = false,
    --switchto = false,
    --ignore_net_active_window = true,
}

--defwinprop {
--    class    = "Zim",
--    instance = "zim",
--    target   = "ZimFrame",
--}

-- of apps don't set enough props to be able to match them
--defwinprop {
--    class   = "",
--    name    = "kinectGui",
--    target  = "OfApp",
--}




--
-- Layouts
-- See cfg_layouts.lua
--

-- Tiled frame template for the layouts below
local a_frame = {
    type="WSplitRegion",
    regparams = {
        type = "WFrame",
        frame_style = "frame-tiled"
    }
}

-- Helper function for generating splits for layouts
local function mksplit(dir, tl, br, float)
    return {
        type = (float and "WSplitFloat" or "WSplitSplit"),
        dir = dir,
        tls = 1,
        brs = 1,
        tl = tl,
        br = br,
    }
end

local function mktiling(split_tree)
    return {
        managed = {
            {
                type = "WTiling",
                bottom = true, -- Make it the bottom of the group
                split_tree = split_tree,
            }
        }
    }
end

-- Tiling for coding. One long area for left col (for editor) and a vsplit on
-- the right col (terms, browsers etc).
ioncore.deflayout("Coding",
    mktiling(
        mksplit("horizontal", a_frame, mksplit("vertical", a_frame, a_frame))
    )
)


--
-- Start some programs
--
os.execute("~/.notion/startup.sh 1>~/.notion/startup.log 2>&1")
