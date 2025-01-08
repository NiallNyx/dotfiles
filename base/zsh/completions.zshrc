function _setup_completions_dotnet {
    function _get_completions_dotnet {
        local completions=("$(dotnet complete "$words")")

        # If the completion list is empty, just continue with filename selection
        if [ -z "$completions" ]
        then
            _arguments '*::arguments: _normal'
            return
        fi

        # This is not a variable assignment, don't remove spaces!
        _values = "${(ps:\n:)completions}"
    }
    compdef _get_completions_dotnet dotnet
}

function _setup_completions_npm {
    function _get_completions_npm {
        local si=$IFS
        compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                    COMP_LINE=$BUFFER \
                    COMP_POINT=0 \
                    npm completion -- "${words[@]}" \
                    2>/dev/null)
        IFS=$si
    }
    compdef _get_completions_npm npm
}
