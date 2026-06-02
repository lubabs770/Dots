# Zsh Options Reference

| Option               | State | Description                                          |
| -------------------- | ----- | ---------------------------------------------------- |
| aliases              | off   | Expand aliases                                       |
| aliasfuncdef         | off   | Allow alias names to be used as function definitions |
| allexport            | off   | Auto-export all new/modified variables               |
| alwayslastprompt     | off   | Return to last prompt after completions              |
| alwaystoend          | off   | Move cursor to end of word on completion             |
| appendcreate         | off   | Allow `>>` to create files (with noclobber)          |
| appendhistory        | off   | Append to history file instead of overwriting        |
| autocd               | off   | `cd` into a directory by typing its name             |
| autocontinue         | off   | Automatically continue suspended jobs on disown      |
| autolist             | off   | List completions on ambiguous tab                    |
| automenu             | off   | Show completion menu on successive tab               |
| autonamedirs         | off   | Auto-add variables holding paths as named dirs       |
| autoparamkeys        | off   | Remove trailing special chars when completing params |
| autoparamslash       | off   | Append `/` when completing directory params          |
| autopushd            | off   | `cd` pushes old dir onto the dir stack               |
| autoremoveslash      | off   | Strip trailing `/` on completed directories          |
| autoresume           | off   | Resume matching suspended job on command name        |
| badpattern           | off   | Error on bad glob patterns (vs. pass through)        |
| banghist             | off   | Enable `!`-style history substitution                |
| bareglobqual         | off   | Allow glob qualifiers without parens                 |
| bashautolist         | off   | Bash-style ambiguous completion listing              |
| bashrematch          | off   | `$MATCH` array indexing like bash                    |
| beep                 | off   | Beep on errors in ZLE                                |
| bgnice               | off   | Run background jobs at lower priority                |
| braceccl             | off   | Allow character class ranges in brace expansion      |
| bsdecho              | off   | `echo` doesn't interpret backslash escapes           |
| caseglob             | off   | Case-insensitive globbing                            |
| casematch            | off   | Case-insensitive regex in `=~`                       |
| casepaths            | off   | Apply caseglob to path components                    |
| cbases               | off   | Output hex/octal literals in C notation              |
| cdablevars           | off   | Try variable as dir name if `cd` arg not found       |
| cdsilent             | off   | Suppress `cd` output for named dirs                  |
| chasedots            | off   | Resolve `..` in `cd` before following symlinks       |
| chaselinks           | off   | Resolve symlinks in `cd`                             |
| checkjobs            | off   | Warn about running/stopped jobs on exit              |
| checkrunningjobs     | off   | Warn about running (not just stopped) jobs on exit   |
| clobber              | off   | Allow `>` to overwrite existing files                |
| clobberempty         | off   | Allow `>` to overwrite only empty files              |
| combiningchars       | on    | Handle Unicode combining characters correctly        |
| completealiases      | off   | Complete aliases as distinct commands                |
| completeinword       | off   | Complete from cursor position mid-word               |
| continueonerror      | off   | Continue script after a compile-time error           |
| correct              | off   | Suggest spelling corrections for commands            |
| correctall           | off   | Suggest spelling corrections for all arguments       |
| cprecedences         | off   | Use C-style operator precedence in math              |
| cshjunkiehistory     | off   | `!` history like csh                                 |
| cshjunkieloops       | off   | Allow `end` as loop terminator like csh              |
| cshjunkiequotes      | off   | Csh-compatible quoting behavior                      |
| cshnullcmd           | off   | Csh-style null command behavior                      |
| cshnullglob          | off   | Silently drop failed globs like csh                  |
| debugbeforecmd       | off   | Run `DEBUG` trap before each command                 |
| dvorak               | off   | Use Dvorak keyboard layout for correction            |
| emacs                | off   | Emacs keybindings in ZLE                             |
| equals               | off   | Expand `=cmd` to path of cmd                         |
| errexit              | off   | Exit script on any error                             |
| errreturn            | off   | Return from function on error                        |
| evallineno           | off   | Track line numbers through `eval`                    |
| exec                 | off   | Execute commands (off = dry run)                     |
| extendedglob         | off   | Enable extended glob operators (`#`, `^`, `~`)       |
| extendedhistory      | off   | Save timestamps in history file                      |
| flowcontrol          | off   | Enable `^S`/`^Q` flow control                        |
| forcefloat           | off   | Force floating-point math results                    |
| functionargzero      | off   | Set `$0` to function/script name                     |
| glob                 | off   | Enable filename globbing                             |
| globalexport         | off   | Exported variables are global                        |
| globalrcs            | off   | Source global rc files (`/etc/zshrc` etc.)           |
| globassign           | off   | Glob in assignment values                            |
| globcomplete         | off   | Treat glob patterns as glob during completion        |
| globdots             | off   | Match dotfiles without explicit leading `.`          |
| globstarshort        | off   | Allow `**` as shorthand for `**/*`                   |
| globsubst            | off   | Glob expansion on substituted values                 |
| hashcmds             | off   | Hash command paths on first use                      |
| hashdirs             | off   | Hash dirs in PATH on first use                       |
| hashexecutablesonly  | off   | Only hash actually executable files                  |
| hashlistall          | off   | Hash all commands at startup                         |
| histallowclobber     | off   | Allow `>` clobber when using history                 |
| histbeep             | off   | Beep on history errors                               |
| histexpiredupsfirst  | off   | Expire duplicate history entries first               |
| histfcntllock        | off   | Use `fcntl` for history file locking                 |
| histfindnodups       | off   | Skip duplicate entries in history search             |
| histignorealldups    | off   | Remove all older duplicate history entries           |
| histignoredups       | off   | Don't add consecutive duplicate entries              |
| histignorespace      | off   | Don't save history entries starting with space       |
| histlexwords         | off   | Use shell lexing to split history entries            |
| histnofunctions      | off   | Don't store function defs in history                 |
| histnostore          | off   | Don't store `history`/`fc` commands in history       |
| histreduceblanks     | off   | Strip extra whitespace from history entries          |
| histsavebycopy       | off   | Write history file by copying then renaming          |
| histsavenodups       | off   | Don't save duplicate entries to history file         |
| histsubstpattern     | off   | Allow glob patterns in history substitution          |
| histverify           | off   | Show history expansion before executing              |
| hup                  | off   | Send SIGHUP to jobs when shell exits                 |
| ignorebraces         | off   | Disable brace expansion                              |
| ignoreclosebraces    | off   | Ignore unmatched `}` in command position             |
| ignoreeof            | off   | Don't exit on `^D`                                   |
| incappendhistory     | off   | Append to history file immediately (no timestamps)   |
| incappendhistorytime | off   | Append to history file immediately with timestamps   |
| interactive          | on    | Shell is interactive                                 |
| interactivecomments  | off   | Allow `#` comments in interactive shell              |
| ksharrays            | off   | Arrays are 0-indexed like ksh                        |
| kshautoload          | off   | Autoload functions like ksh                          |
| kshglob              | off   | Enable ksh-style glob operators                      |
| kshoptionprint       | off   | `setopt` output in ksh format                        |
| kshtypeset           | off   | Allow `typeset` assignments without `=`              |
| kshzerosubscript     | off   | `$arr[0]` refers to `$arr[1]` (ksh compat)           |
| listambiguous        | off   | List completions only when truly ambiguous           |
| listbeep             | off   | Beep on ambiguous completion                         |
| listpacked           | off   | Pack completion list into fewer lines                |
| listrowsfirst        | off   | List completions in rows instead of columns          |
| listtypes            | off   | Show file type markers in completion list            |
| localloops           | off   | `break`/`continue` are local to enclosing loop       |
| localoptions         | off   | Option changes in functions are local                |
| localpatterns        | off   | Pattern changes in functions are local               |
| localtraps           | off   | Trap changes in functions are local                  |
| login                | on    | Shell is a login shell                               |
| longlistjobs         | off   | Show PID in job listings                             |
| magicequalsubst      | off   | Expand `=` RHS values as paths                       |
| mailwarning          | off   | Warn if mailfile changed since last check            |
| markdirs             | off   | Append `/` to dir names in completion                |
| menucomplete         | off   | Use menu-style completion immediately                |
| monitor              | off   | Enable job control                                   |
| multibyte            | off   | Disable multibyte character support                  |
| multifuncdef         | off   | Disable defining multiple functions at once          |
| multios              | off   | Disable multiple redirections to same FD             |
| nonomatch            | off   | Pass failed globs literally instead of erroring      |
| notify               | off   | Report job status immediately (not at prompt)        |
| nullglob             | off   | Remove failed globs from argument list               |
| numericglobsort      | off   | Sort glob results numerically                        |
| octalzeroes          | off   | Interpret leading-zero numbers as octal              |
| overstrike           | off   | ZLE insert mode defaults to overstrike               |
| pathdirs             | off   | Search `PATH` for `cd` argument                      |
| pathscript           | off   | Resolve script path via PATH                         |
| pipefail             | off   | Pipeline fails if any command fails                  |
| posixaliases         | off   | Posix-compliant alias handling                       |
| posixargzero         | off   | `$0` is the script name per POSIX                    |
| posixbuiltins        | off   | Builtins behave per POSIX                            |
| posixcd              | off   | POSIX-compliant `cd` behavior                        |
| posixidentifiers     | off   | Only allow POSIX-valid variable names                |
| posixjobs            | off   | POSIX-compliant job control                          |
| posixstrings         | off   | POSIX-compliant string handling                      |
| posixtraps           | off   | POSIX-compliant trap behavior                        |
| printeightbit        | off   | Print 8-bit chars without quoting                    |
| printexitvalue       | off   | Print exit value of non-zero exits                   |
| privileged           | off   | Don't source user rc files (for suid scripts)        |
| promptbang           | off   | `!` in prompt expands history number                 |
| promptcr             | off   | Print CR before prompt to clear partial lines        |
| promptpercent        | off   | Enable `%` prompt escape sequences                   |
| promptsp             | off   | Preserve partial lines before prompt                 |
| promptsubst          | on    | Enable parameter/command expansion in prompts        |
| pushdignoredups      | off   | Don't push duplicate dirs onto dir stack             |
| pushdminus           | off   | Swap `+`/`-` meaning on dir stack                    |
| pushdsilent          | off   | Suppress pushd/popd output                           |
| pushdtohome          | off   | `pushd` with no args goes to `$HOME`                 |
| rcexpandparam        | off   | Array expansion like rc shell                        |
| rcquotes             | off   | Allow `''` inside single quotes (rc-style)           |
| rcs                  | off   | Source rc files on startup                           |
| recexact             | off   | Accept exact match even if completions exist         |
| rematchpcre          | off   | Use PCRE for `=~` regex matching                     |
| restricted           | off   | Enable restricted shell mode                         |
| rmstarsilent         | off   | Suppress confirmation on `rm *`                      |
| rmstarwait           | off   | Wait before prompting on `rm *`                      |
| sharehistory         | off   | Share history between all active sessions            |
| shfileexpansion      | off   | Sh-compatible file expansion                         |
| shglob               | off   | Sh-compatible globbing                               |
| shinstdin            | on    | Reading commands from stdin                          |
| shnullcmd            | off   | Sh-compatible null command behavior                  |
| shoptionletters      | off   | Single-letter option names like sh                   |
| shortloops           | off   | Allow short `for`/`while` without `do`               |
| shortrepeat          | off   | Allow short `repeat` without `do`                    |
| shwordsplit          | off   | Word-split unquoted variables like sh                |
| singlecommand        | off   | Exit after one command (like `sh -c`)                |
| singlelinezle        | off   | ZLE operates in single-line mode                     |
| sourcetrace          | off   | Print source file/line as commands run               |
| sunkeyboardhack      | off   | Ignore stray `\`` at end of line                     |
| transientrprompt     | off   | Clear right prompt when line is accepted             |
| trapsasync           | off   | Run traps asynchronously                             |
| typesetsilent        | off   | Suppress output of `typeset` with no args            |
| typesettounset       | off   | Allow typeset on unset vars without error            |
| unset                | off   | Treat unset variables as empty string                |
| verbose              | off   | Print input lines as they are read                   |
| vi                   | off   | Vi keybindings in ZLE                                |
| warncreateglobal     | off   | Warn when function creates a global variable         |
| warnnestedvar        | off   | Warn when inner function shadows outer variable      |
| xtrace               | off   | Print commands and args as they execute (`set -x`)   |
| zle                  | off   | Use the Zsh Line Editor                              |
