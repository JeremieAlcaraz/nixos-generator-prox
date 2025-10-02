{ config, lib, pkgs, ... }:
{
  #### Réseau de base (Proxmox)
  networking.hostName = "nixos-test";
  networking.useNetworkd = true;                  # ou networking.networkmanager.enable = true;
  networking.interfaces.ens18.useDHCP = true;     # explicite sur l'interface VirtIO par défaut

  #### Cloud-init : désactivé (évite qu'il touche au DNS/réseau)
  services.cloud-init.enable = false;

  #### Tailscale
  services.tailscale.enable = true;
  services.tailscale.openFirewall = true;         # ouvre 41641/udp et règles nécessaires
  services.tailscale.extraUpFlags = [
    "--ssh"
    "--accept-dns=false"                          # évite de casser la résolution tant que TS n'est pas loggé
    # "--accept-routes=true"                     # active si tu veux recevoir des routes
    # "--exit-node=<ID>" "--exit-node-allow-lan-access=true"
  ];

  #### Kernel : interface TUN pour TS
  boot.kernelModules = [ "tun" ];

  #### Firewall (optionnel mais utile avec exit nodes / subnet routes)
  # networking.firewall.checkReversePath = "loose";

  #### SSH (comme tu avais)
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";

  #### Paquets
  environment.systemPackages = with pkgs; [ vim htop curl git ];

  #### (Sécurité) Mot de passe root de test - à changer ensuite !
  users.users.root.password = "test123";

  #### Version système
  system.stateVersion = "24.05";
}
