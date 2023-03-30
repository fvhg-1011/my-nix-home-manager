{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "favian";
  home.homeDirectory = "/home/favian";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  # direct download
  # tldr
  # Man Color
  home.packages = with pkgs;[	
		# rust based
		macchina # neofetch rust based
    bat # cat based rust
    exa # list based rust
    zoxide # cd based rust
		bottom # htop rust based 
    zellij # tmux rust based
    lfs # df rust based
    ripgrep # grep rust based
    fd # find rust based
    atuin # history rust based
    felix-fm #file manager rust based
		fnm #node version manager rust based
		
    #misc
    trash-cli # rm put to the bin
		neofetch # show pc information
		tldr # simple manual page
    lazygit #terminal ui git command written in go
    translate-shell #translate in terminal
		mycli #colorshell mysql cli
    glow #markdown renderer
       
    #Environment list
    rustc
    cargo #rust dependencies
    lua 
    awscli2
    kompose # docker-compose -> to kubernetes yml
    eksctl # eks cli
		doctl # digital ocean cli
    kubernetes-helm
    terraform
    ansible
		vagrant	
		jenkins

    #language server
    nodePackages_latest.yaml-language-server #YAML
		];
  #needs config
	#Zoxide
	programs.zoxide = {
		enable = true;
		enableFishIntegration = true;
		enableBashIntegration = true;

	};
  #Helix - Post Modern Terminal Code Editor
  programs.helix = {
    enable = true;
    settings = {
      theme = "darcula";
      editor = {
        line-number = "relative";
        cursor-shape = {
          normal = "block";
          insert = "bar";  
        };  
      };    
    };
  };	
  #Neovim - Modern Terminal Code Editor
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraLuaConfig = 
    ''
    vim.opt.relativenumber = true
    vim.opt.smartindent = true
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.titlestring = "%<%F%=%l/%L - nvim" 
    vim.opt.hlsearch = true
    vim.opt.cursorline = true
    vim.opt.number = true
    
    '';
  };
  #Fish 
  programs.fish = {
    enable = true;
    shellAliases = {
       ls   = "exa --grid --color auto --icons --sort=type";
       ll   = "exa --long --color always --icons --sort=type";
       la   = "exa --grid --all --color auto --icons --sort=type";
       lla  = "exa --long --all --color auto --icons --sort=type";
       cat  = "bat";
       rm   = "trash";
       df   =  "lfs";
       history = "history | cat -n";
    };
    shellAbbrs = {
      #Docker
      d    = "docker";
      dc   = "docker container";
      di   = "docker image";
      dr   = "docker run";
      dv   = "docker volume";
      dcom = "docker compose";
      dbu  = "docker build";
      #Bottom
 			htop = "btm";
			top  = "btm";
      #home-manager
      hmb  = "home-manager build";
      hms  = "home-manager switch";
      #Kubectl
      kube = "kubectl";
          };
    #add lines in interactive section   
    interactiveShellInit = 
    ''
    set -x MANPAGER "sh -c 'col -bx | bat -l man -p '" 
    set -x KUBECONFIG $HOME/.kube/config 
    atuin init fish | source
    eval "$(fnm env)"
    ''; 
  };
  #Starship
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

	#Tmux 
	programs.tmux = {
		enable = true;
		mouse = true;
		shortcut = "a";
		plugins = with pkgs.tmuxPlugins; [
			sensible
			pain-control
			yank
			prefix-highlight
			better-mouse-mode
		];
	};
}
