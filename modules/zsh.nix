{ pkgs, ...}:

{
  config = {
    home-manager.users.rafiyq = { pkgs, ...}: {
      programs.zsh = {
        enable = true;
	autocd = true;
	defaultKeymap= "emacs";
        dotDir = ".config/zsh";
	enableAutosuggestions = true;
	enableCompletion = true;
	history = {
	  size = 500;
	  save = 1000;
	  path = ".config/zsh/zsh_history";
	};

	localVariables = {
	  PROMPT = "%B%F{171}%n%F{135}@%F{99}%M%b %F{81}%~ %f%# ";
	 # RPROMPT = \$vcs_info_msg_0_ ;
	};

	shellAliases = {
	  ls = "ls --color=auto";
	  ll = "ls -AlFH";
	  grep = "grep --color=auto";
	  fgrep = "fgrep --color=auto";
	  egrep = "egrep --color=auto";
	};
      };
    };
  };
}
