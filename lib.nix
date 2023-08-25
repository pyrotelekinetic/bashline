lib: {

  runtimeToggle = pred: x:
    ''$(if [ ${pred} ] && echo "${x}")'';

  runtimeIf = pred: x1: x2:
    ''$(if [ ${pred} ] && echo "${x1}")$(if [ !${pred} ] && echo "${x2}")'';

  builders = {
    buildPS1 =
      { ps1 ? ''\n\[\033[1;31m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\\$\[\033[0m\] ''
      , before ? ""
      , after ? ""
      , sources ? []
      }: with lib;
    let
      sources' = concatMapStringsSep "\n" (x: "source " + x) sources;
      pruneNull = builtins.filter (x: x != null);
    in
      concatLines [
        sources'
        before
        "PS1=${ps1}"
        after
      ];
  };

}
