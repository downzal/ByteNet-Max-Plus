<div align="center">

# ByteNet Max Plus

A fork of Elitriare's ByteNet Max networking module, wich now introduces Hooks, otherwise known as Signals, into the module.

*Documentation found below*
</div>

## What is added

- **Built-in Hooks (Signals):**
  Create local, strictly-typed hooks alongside your packets and queries, with no extra signal library required.
  
- **Unified API:**
  Uses the exact same ```lua defineNamespace({})``` and ```define...``` workflow you already know from BNM.

- **Zero-Overhead Local Namespaces:**
  Defining a namespace with *only* hooks automatically skips network replication and buffer setup, saving memory.

- **High-Performance Signal Engine:**
  Powered by a singly-linked list and coroutine thread pooling for fast, allocation-light firing (```lua :listen, :once, :wait, :send, :disconnectAll```
