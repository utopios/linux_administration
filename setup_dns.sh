#!/bin/bash

# ───────────────────────────────────────────────
# Full BIND9 Installation & Configuration Script
# Features: DNS Cache + Internal Zone + Public Fictive Zone
# Author: ChatGPT
# ───────────────────────────────────────────────

# Define variables for internal and public zones
INTERNAL_DOMAIN="lab.local"             # Internal DNS zone name
PUBLIC_DOMAIN="example.com"             # Fictive public DNS zone name
DNS_IP="192.168.56.10"                  # The static IP address of your DNS server

# TTL value for DNS records (Time To Live)
TTL_VALUE="604800"

# Generate a dynamic Serial Number based on the current date (format YYYYMMDDnn)
SERIAL=$(date +%Y%m%d01)

# ───────────────────────────────────────────────
echo "[+] Installing BIND9 and required tools..."
# Install BIND9 DNS server and useful utilities
apt update && apt install -y bind9 bind9utils bind9-doc dnsutils

# ───────────────────────────────────────────────
echo "[+] Configuring DNS options (caching, forwarding)..."
# Configure the main DNS options, including recursion and forwarders
cat <<EOF > /etc/bind/named.conf.options
options {
    directory "/var/cache/bind";     # Default working directory for BIND cache

    allow-query { any; };            # Allow DNS queries from any client
    recursion yes;                   # Enable recursive DNS (for caching external queries)

    forwarders {                     # Define upstream DNS servers for forwarding
        8.8.8.8;                     # Google DNS
        1.1.1.1;                     # Cloudflare DNS
    };

    dnssec-validation auto;          # Enable automatic DNSSEC validation
    listen-on { any; };              # Listen on all network interfaces
    allow-recursion { any; };        # Allow recursion from any client
};
EOF

# ───────────────────────────────────────────────
echo "[+] Declaring DNS zones (internal and public)..."
# Define the DNS zones in BIND configuration
cat <<EOF > /etc/bind/named.conf.local
zone "$INTERNAL_DOMAIN" {
    type master;                                  # This server is authoritative for this zone
    file "/etc/bind/db.$INTERNAL_DOMAIN";         # Zone file location
};
zone "$PUBLIC_DOMAIN" {
    type master;
    file "/etc/bind/db.$PUBLIC_DOMAIN";
};
EOF

# ───────────────────────────────────────────────
echo "[+] Creating internal zone file for $INTERNAL_DOMAIN..."
# Create the zone file for internal DNS (lab.local)
cat <<EOF > /etc/bind/db.$INTERNAL_DOMAIN
\$TTL    $TTL_VALUE
@       IN      SOA     ns1.$INTERNAL_DOMAIN. admin.$INTERNAL_DOMAIN. (
                              $SERIAL   ; Serial number
                         $TTL_VALUE     ; Refresh time
                          86400         ; Retry time
                        2419200         ; Expire time
                         $TTL_VALUE )   ; Negative Cache TTL
;
@       IN      NS      ns1.$INTERNAL_DOMAIN.      # Define the authoritative name server

ns1     IN      A       $DNS_IP                    # IP address of the DNS server (ns1)
www     IN      A       192.168.56.100             # Example web server in internal network
mail    IN      A       192.168.56.101             # Example mail server in internal network
EOF

# ───────────────────────────────────────────────
echo "[+] Creating public fictive zone file for $PUBLIC_DOMAIN..."
# Create a fake public zone (example.com) for demonstration purposes
cat <<EOF > /etc/bind/db.$PUBLIC_DOMAIN
\$TTL    $TTL_VALUE
@       IN      SOA     ns1.$PUBLIC_DOMAIN. admin.$PUBLIC_DOMAIN. (
                              $SERIAL
                         $TTL_VALUE
                          86400
                        2419200
                         $TTL_VALUE )
;
@       IN      NS      ns1.$PUBLIC_DOMAIN.

ns1     IN      A       $DNS_IP
www     IN      A       192.168.56.11
mail    IN      A       192.168.56.12
EOF

# ───────────────────────────────────────────────
echo "[+] Checking configuration syntax..."
# Validate BIND9 configuration files to catch errors before restarting
named-checkconf                                     # Check global config
named-checkzone $INTERNAL_DOMAIN /etc/bind/db.$INTERNAL_DOMAIN   # Check internal zone
named-checkzone $PUBLIC_DOMAIN /etc/bind/db.$PUBLIC_DOMAIN       # Check public zone

# ───────────────────────────────────────────────
echo "[+] Restarting BIND9 service..."
# Restart BIND9 to apply all configurations
systemctl restart bind9

# ───────────────────────────────────────────────
echo "[✔] BIND9 setup completed successfully!"
echo "You can now test with: dig @localhost www.$INTERNAL_DOMAIN"
