function curb --desc "Curl and write to a file named after the last segment of the URL (`curb https://example.com/hello.txt` -> hello.txt)"
    argparse --name="curb" 'f/force' 'd/outdir=' -- $argv
    
    if test -z $_flag_outdir
        set -f _flag_outdir "."
    end
    set -f path $_flag_outdir/(basename $argv[-1])

    if test '(' -e $path ')' -a '(' -z "$_flag_force" ')'
        echo "Error: a file at $path already exists."
        return 1
    end
    echo curl --output=$path $argv
    return $status
end