# macOS directory shortcuts
abbr -a -g dt '~/Desktop'
abbr -a -g gd '~/Google\ Drive'

abbr -g appstore "open '/System/Applications/App Store.app'"

# macOS's System Prefs app is in a different location depending on version
set -l system_settings '/System/Applications/System Settings.app' # macOS 13
if test ! -e $system_settings
    #macOS 10.15
    set system_settings '/System/Applications/System Preferences.app'
    if test ! -e system_settings
        # macOS <= 10.14
        set system_settings '/Applications/System Preferences.app'
    end
end
abbr -g settings "open '$system_settings'"

set -l finder '/System/Applications/Finder.app'
if test -e $finder
    # macOS <= 10.14
    set finder '/Applications/Finder.app'
else
    set finder '/Applications/Finder.app'
end

abbr -g finder "open '$finder'"
