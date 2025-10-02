{ config, lib, pkgs, ... }:
{
  # Configuration minimale pour test
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";
  
  # Utilisateur root avec mot de passe simple pour test
  users.users.root.password = "test123";
  
  # Quelques paquets de base
  environment.systemPackages = with pkgs; [
    vim
    htop
    curl
    git
  ];

  # Configuration réseau de base
  networking.hostName = "nixos-test";
  networking.useDHCP = lib.mkDefault true;

  # Configuration Tailscale minimale
  services.tailscale.enable = true;

  # Version du système
  system.stateVersion = "24.05";
}
