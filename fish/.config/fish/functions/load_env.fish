#!/usr/bin/env fish

# Function to load .env file in Fish shell
function load_env
    set -l env_file ".env"
    if test -n "$argv[1]"
        set env_file "$argv[1]"
    end

    if test -f $env_file
        echo "Loading environment variables from $env_file"
        
        # Read the file line by line
        for line in (cat $env_file)
            # Skip comments and empty lines
            if string match -rq '^\s*#' $line; or test -z (string trim $line)
                continue
            end
            
            # Extract variable name and value
            if string match -rq '^\s*([A-Za-z0-9_]+)=(.*)$' $line
                set -l var_name (string match -r '^\s*([A-Za-z0-9_]+)=' $line)[2]
                set -l var_value (string match -r '^\s*[A-Za-z0-9_]+=(.*)$' $line)[2]
                
                # Remove quotes if present
                set var_value (string trim -c '"' (string trim -c "'" $var_value))
                
                # Export the variable
                set -gx $var_name $var_value
                echo "Exported: $var_name"
            end
        end
    else
        echo "Error: $env_file not found"
        return 1
    end
end

# Call the function with optional path to .env file
# Usage: source load_env.fish [path/to/.env]
load_env $argv
