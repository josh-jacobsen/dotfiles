if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    # Get current user
    set -l current_user (whoami)
    
    # Get the current working directory
    set -l cwd (pwd)
    
    # Get the user's home directory
    set -l home_dir /Users/$current_user
    
    # Initialize the display path
    set -l display_path $cwd
    # Get current user
    set -l current_user (whoami)
    
    # Get the current working directory
    set -l cwd (pwd)
    
    # Get the user's home directory
    set -l home_dir /Users/$current_user
    
    # Initialize the display path
    set -l display_path $cwd
    
    # Check if the current path starts with the home directory
    # but is not exactly /Users
    if string match -q "/Users/*" $cwd
        # If it's exactly the user's home directory or a subdirectory
        if string match -q "$home_dir*" $cwd
            # Replace the home directory portion with ~
            set display_path (string replace -r "^$home_dir" "~" $cwd)
        end
    end
    
    # Get git branch if in a git repository
    set -l git_branch (git branch 2>/dev/null | grep '\*' | sed -e 's/\* //')
    
    # Print the prompt with username, processed path, and git branch if available
    echo -n (set_color green)$current_user(set_color normal)' '
    echo -n (set_color blue)$display_path(set_color normal)
    if test -n "$git_branch"
        echo -n ' ('(set_color yellow)$git_branch(set_color normal)')'
    end
    echo -n ' $ '


end


# function fish_prompt
#     echo $PWD '> '
# end
source ~/.asdf/asdf.fish
# Added by Windsurf
fish_add_path /Users/josh/.codeium/windsurf/bin
