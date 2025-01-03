#!/usr/bin/env nu

def main [name: string id: int] {
  let public_path = $name + "/public"
  let private_path = $name + "/private"
  let cfg_path = $name + "/" + $name + ".conf"

  mkdir $name
  wg genkey | save ($private_path)
  cat ($private_path) | wg pubkey | save ($public_path)

  let config = $"[Interface]
Address = 10.0.0.($id)/24
PrivateKey = (open ($private_path) | to text)
DNS = 10.0.0.1

[Peer]
PublicKey = uQj7U0dDix8yJ0MDKTdAxbyuMaLr96S8kFzZzzXoJBc=
Endpoint = 66.176.30.56:42586
AllowedIPs = 0.0.0.0/0
" | save ($cfg_path)

chmod -R og-xwr $name

let public = $"Public: (open ($public_path) | to text)"
let ip = $"Address: 10.0.0.($id)/24"

print $public
print $ip

cat ($cfg_path) | qrencode -t ANSIUTF8
}
