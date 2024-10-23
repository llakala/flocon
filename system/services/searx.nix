{pkgs, ...}: {
  services = {
    searx = {
      enable = true;
      package = pkgs.searxng;
      settings = {
        server = {
          secret_key = "TODO_USE_SOPS_INSTEAD";
          port = 8888; # Internal port
          bind_address = "localhost"; # Only listen locally
          base_url = "https://search.nezia.dev/";
          image_proxy = true;
          default_http_headers = {
            X-Content-Type-Options = "nosniff";
            X-XSS-Protection = "1; mode=block";
            X-Download-Options = "noopen";
            X-Robots-Tag = "noindex, nofollow";
            Referrer-Policy = "no-referrer";
          };
        };
        engines = [
          {
            name = "qwant";
            disabled = true;
          }
        ];
      };
    };

    caddy = {
      enable = true;
      virtualHosts."search.nezia.dev" = {
        extraConfig = ''
          encode gzip
          reverse_proxy localhost:8888 {
            header_up Host {host}
            header_up X-Real-IP {remote_addr}
            header_up X-Forwarded-For {remote_addr}
            header_up X-Forwarded-Proto {scheme}
          }
        '';
      };
    };
  };

  # Open required ports
  networking.firewall = {
    allowedTCPPorts = [80 443]; # For Caddy
  };
}

