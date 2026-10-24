set -l fzf_theme_opts "\
--color=bg+:#544245
--color=bg:#191113
--color=spinner:#efdfe0
--color=hl:#ffb4ab
--color=fg:#efdfe0
--color=header:#ffb4ab
--color=info:#ffb1c1
--color=pointer:#efdfe0
--color=marker:#d9c1c4
--color=fg+:#efdfe0
--color=prompt:#ffb1c1
--color=hl+:#ffb4ab
--color=selected-bg:#544245
--color=border:#544245
--color=label:#efdfe0"

if set -q FZF_DEFAULT_OPTS[1]; and test -n "$FZF_DEFAULT_OPTS"
    set -Ux FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS
$fzf_theme_opts"
else
    set -Ux FZF_DEFAULT_OPTS "$fzf_theme_opts"
end
