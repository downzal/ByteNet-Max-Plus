<div align="center">

# ByteNet Max Plus

A fork of Elitriare's ByteNet Max networking module, wich now introduces Hooks, otherwise known as Signals, into the module.

*Documentation found below*
</div>

## What is added

- **Built-in Hooks (Signals):**
  Create local, strictly-typed hooks alongside your packets and queries, with no extra signal library required.
  
- **Unified API:**
  Uses the exact same ```defineNamespace({})``` and ```define...``` workflow you already know from BNM.

- **Zero-Overhead Local Namespaces:**
  Defining a namespace with *only* hooks automatically skips network replication and buffer setup, saving memory.

- **High-Performance Signal Engine:**
  Powered by a singly-linked list and coroutine thread pooling for fast, allocation-light firing (```:listen, :once, :wait, :send, :disconnectAll```

# Small example

*Setting up the hooks:*
```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ByteNetMaxPlus = require(ReplicatedStorage.ByteNetMaxPlus)

return ByteNetMaxPlus.defineNamespace("Repo", function()
  return {
    packets = {};

    queries = {};

    hooks = {
        --our hook
        onPlayerDamaged = ByteNetMaxPlus.defineHook<Player, number>();
      }
  }
end)
```

*Listening to the hooks:*
```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Repo = require(ReplicatedStorage.Networking.Repo)

--the hook
local onPlayerDamaged = Repo.hooks.onPlayerDamaged

--listen to the hook
local connection = onPlayerDamaged:listen(function()
  print(player.Name.." took "..damage.." damage!"
end)

--fire the hook locally
onPlayerDamaged:send(somePlayer, 25)

--disconnect when no longer needed
connection:disconnect()
```

# License
ByteNet Max Plus is available under the [MIT License](LICENSE).
