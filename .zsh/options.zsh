# ZLE
setopt no_beep               # DO NOT Beep on error.

# Initialization
setopt interactive_comments  # Allow comments in interactive shells.
setopt mail_warning          # Prints warning if mail accessed since shell last checked.

# Prompting
setopt prompt_subst          # Enable expansion in prompt.

# Job Control
setopt auto_resume           # Tries to resume command of same name.
setopt notify                # Report BG job status notifications immediately.
setopt no_bg_nice            # DO NOT Drop BG job 'nice' priority.
setopt long_list_jobs        # List jobs in long format by default.

# History
setopt share_history         # All zsh instances write and restore from same history file.
                             #     Implies inc_append_hist and extended_history.
#setopt inc_append_history   # History entries appended on exec rather than shell exit.
#setopt append_history       # All zsh instances append history file on exit.
#setopt extended_history     # Puts timestamps in the history.
setopt hist_ignore_dups      # Do not enter consecutavely duplicate commands into the history.

# Globbing
setopt no_glob_dots          # DO NOT Include hidden .dotfiles implicitly in glob operations.
setopt extended_glob         # Treat special characters as glob patterns.

# Spelling
setopt correct               # Command spelling correction.
setopt no_correct_all        # DO NOT Attempt spelling corrections to all arguments.

# Completion
setopt auto_list             # Automatically list choices for ambiguous completion.
setopt rec_exact             # In completion, always recognize exact matches.
setopt auto_param_slash      # Append a slash for autocompleted parameter directories.
setopt auto_remove_slash     # If a slash is added to a completed dir, remove it if the next char is a word delimeter.
setopt no_menu_complete      # DO NOT Insert first match and bring up menu on subsequent completion attemps.
setopt no_complete_aliases   # DO NOT Treat aliases as separate commands.

setopt list_packed           # Use variable column widths for completion menu.
setopt list_types            # Show filetype in completion menu.

# Directory changing.
setopt auto_cd               # If dir is issued as a command and is not a command, cd to that dir.
setopt cdable_vars           # If cd argument is not a dir, try things to find a matching dir.
setopt auto_pushd            # Automatically add new directory to stack on cd.
setopt pushd_silent          # Suppress pushd announcement.
setopt pushd_minus           # Reverse the directory stack order.
setopt pushd_to_home         # Alias `pushd` => `pushd $HOME`.
setopt pushd_ignore_dups     # Stack entries are unique.

