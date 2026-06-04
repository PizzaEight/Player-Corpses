{
  "type": "minecraft:multi_action",
  "title": "Player Corpses",
  "body": {
    "type": "minecraft:plain_message",
    "contents": "Config Screen"
  },
  "columns": 2,
  "actions": [
    {
      "label": "Despawn Timer +1 Minute",
      "tooltip": "Corpses spawned when a player dies will despawn after that amount of time passes",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 999"
      }
    },
    {
      "label": "Despawn Timer -1 Minute",
      "tooltip": "Corpses spawned when a player dies will despawn after that amount of time passes",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1000"
      }
    },
    {
      "label": "Has Gore: True",
      "tooltip": "Corpses spawned when a player dies will have blood and bone particles and sounds",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1001"
      }
    },
    {
      "label": "Has Gore: False",
      "tooltip": "Corpses spawned when a player dies will have blood and bone particles and sounds",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11001"
      }
    },
    {
      "label": "Can Get Zombified: True",
      "tooltip": "When a player dies to a zombie a corpse wont spawn, instead a zombie with that player's head will spawn with all of the player's items, to get them back they must kill it",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1002"
      }
    },
    {
      "label": "Can Get Zombified: False",
      "tooltip": "When a player dies to a zombie a corpse wont spawn, instead a zombie with that player's head will spawn with all of the player's items, to get them back they must kill it",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11002"
      }
    },
    {
      "label": "Gives Death Coords: True",
      "tooltip": "Players will get a message with their death coordinates in chat after they die",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1003"
      }
    },
    {
      "label": "Gives Death Coords: False",
      "tooltip": "Players will get a message with their death coordinates in chat after they die",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11003"
      }
    },
    {
      "label": "Can Only Be Looted By Owner: True",
      "tooltip": "Corpses spawned when a player dies will only be able to be looted by that same player",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1004"
      }
    },
    {
      "label": "Can Only Be Looted By Owner: False",
      "tooltip": "Corpses spawned when a player dies will only be able to be looted by that same player",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11004"
      }
    },
    {
      "label": "Can Be Looted By Right Clicking: True",
      "tooltip": "Corpses will be able to be looted by right clicking on it rather than sneaking",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1005"
      }
    },
    {
      "label": "Can Be Looted By Right Clicking: False",
      "tooltip": "Corpses will be able to be looted by right clicking on it rather than sneaking",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11005"
      }
    },
    {
      "label": "Instant Looting: True",
      "tooltip": "Corpses will be able to be looted instantly after sneaking near them",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1006"
      }
    },
    {
      "label": "Instant Looting: False",
      "tooltip": "Corpses will be able to be looted instantly after sneaking near them",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11006"
      }
    },
    {
      "label": "Stays After Being Looted: True",
      "tooltip": "Corpses spawned when a player dies will stay forever, even after they have been looted by a player",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1007"
      }
    },
    {
      "label": "Stays After Being Looted: False",
      "tooltip": "Corpses spawned when a player dies will stay forever, even after they have been looted by a player",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11007"
      }
    },
    {
      "label": "Gives Player's Head: True",
      "tooltip": "Looting a player's corpse will give that player's head along with the rest of the items",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1012"
      }
    },
    {
      "label": "Gives Player's Head: False",
      "tooltip": "Looting a player's corpse will give that player's head along with the rest of the items",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11012"
      }
    },
    {
      "label": "Has Player's Name: True",
      "tooltip": "Corpses spawned when a player dies will have their name",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1010"
      }
    },
    {
      "label": "Has Player's Name: False",
      "tooltip": "Corpses spawned when a player dies will have their name",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11010"
      }
    },
    {
      "label": "Has Description: True",
      "tooltip": "Corpses spawned when a player dies will have a description explaining how to loot them",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1011"
      }
    },
    {
      "label": "Has Description: False",
      "tooltip": "Corpses spawned when a player dies will have a description explaining how to loot them",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11011"
      }
    },
    {
      "label": "Floats in Water: True",
      "tooltip": "Corpses spawned when a player dies will float in water",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1013"
      }
    },
    {
      "label": "Floats in Water: False",
      "tooltip": "Corpses spawned when a player dies will float in water",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11013"
      }
    },
    {
      "label": "Floats in Lava: True",
      "tooltip": "Corpses spawned when a player dies will float in lava",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1014"
      }
    },
    {
      "label": "Floats in Lava: False",
      "tooltip": "Corpses spawned when a player dies will float in lava",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11014"
      }
    },
    {
      "label": "Can Burn: True",
      "tooltip": "Corpses spawned when a player dies will burn when in lava or fire",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1015"
      }
    },
    {
      "label": "Can Burn: False",
      "tooltip": "Corpses spawned when a player dies will burn when in lava or fire",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11015"
      }
    },
    {
      "label": "Saves Items From Void: True",
      "tooltip": "Corpses spawned when a player dies in the void will float before the damage zone, able to be looted",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1017"
      }
    },
    {
      "label": "Saves Items From Void: False",
      "tooltip": "Corpses spawned when a player dies in the void will float before the damage zone, able to be looted",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11017"
      }
    },
    {
      "label": "Remove Corpse Finder Access: True",
      "tooltip": "Players wont be able to access the Corpse Finder screen after typing /trigger corpse_finder",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1018"
      }
    },
    {
      "label": "Remove Corpse Finder Access: False",
      "tooltip": "Players wont be able to access the Corpse Finder screen after typing /trigger corpse_finder",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11018"
      }
    },
    {
      "label": "Remove Config Screen Access: True",
      "tooltip": "Players wont be able to access the config screen after typing /trigger config, the only way to access it will be for an op player to type /function player_corpses:config/show",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 1016"
      }
    },
    {
      "label": "Remove Config Screen Access: False",
      "tooltip": "Players wont be able to access the config screen after typing /trigger config, the only way to access it will be for an op player to type /function player_corpses:config/show",
      "width": 193,
      "action": {
        "type": "minecraft:run_command",
        "command": "/trigger config set 11016"
      }
    }
  ]
}