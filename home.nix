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
		#misc
    trash-cli # rm put to the bin
		neofetch # show pc information
		tldr # simple manual page
		];
  #needs config
	#Zoxide
	programs.zoxide = {
		enable = true;
		enableFishIntegration = true;
		enableBashIntegration = true;

	};
  #Helix - Post Modern Code Editor
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
  #Neovim - Modern Code Editor
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
    #enables colored in man
    interactiveShellInit = 
    ''
    set -x MANPAGER "sh -c 'col -bx | bat -l man -p '"  
    set -x KUBECONFIG $HOME/.kube/config 
    ''; 
  };
  #Starship
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
