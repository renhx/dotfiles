#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set private.hjkl_to_arrow 1
/bin/echo -n .
$cli set remap.jis_command2eisuukana_prefer_command 1
/bin/echo -n .
$cli set repeat.initial_wait 416
/bin/echo -n .
$cli set remap.swapcolons 1
/bin/echo -n .
$cli set remap.pc_application2fn 1
/bin/echo -n .
$cli set private.wasd_to_arrow 1
/bin/echo -n .
$cli set private.vim_keybind_apps_esc_with_eisuu 1
/bin/echo -n .
/bin/echo
