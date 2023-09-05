# nix-config
NixOS configuration files

## Use version control for NixOS config
```
git clone git@github.com:bakedSpaceTime/nix-config.git
sudo mv /etc/nixos /etc/nixos.bak
sudo ln -s ~/nix-config/ /etc/nixos
sudo nixos-rebuild switch
```

## Fix SSH issue
`eval $(ssh-agent -s)`