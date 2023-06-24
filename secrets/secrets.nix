let
  ziga = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP7Di0YgzTF67sFnlmcUW6EX/zY3pxXfivTxwZVj7jY+";
  users = [ ziga ];
in {
  "secret1.age".publicKeys = users;
  "ziga.age".publicKeys = users;
}