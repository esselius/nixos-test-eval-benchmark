{
  name = builtins.trace "4. name" "nt";
  testScript = builtins.trace "5. testScript"  "";
  nodes.machine = builtins.trace "6. machine config" {};
}