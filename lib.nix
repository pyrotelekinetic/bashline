lib: {

  inlineToggle = pred: do: ''$(if ${pred} && ${do})'';

  builders = {
    buildPS1 = (
      { ps1 ? ''\n\[\033[1;31m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\\$\[\033[0m\] ''
      , before ? null
      , after ? null
      , scriptDepends ? null
      }: with lib;
    let
      put = x:
        if x == null
        then ""
        else "${x}\n";
      sources =
        if scriptDepends == null
        then ""
        else concatMapStrings (x: "source ${x}\n") scriptDepends;
    in
      ( sources
      + put before
      + put ''PS1="${ps1}"''
      + put after
      )
    );
  };
}
