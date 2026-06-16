tellraw @s {"bold":true,"color":"gold","text":"Player Corpses Version 3.0"}
tellraw @s [{"color":"yellow","text":"By PizzaEight: "},{"click_event":{"action":"open_url","url":"https://www.curseforge.com/members/pizzaeight/projects"},"hover_event":{"action":"show_text","value":[{"text":"open curseforge","color":"#FF792B"}]},"bold":false,"color":"#FF792B","text":"[Curseforge]"}," ",{"click_event":{"action":"open_url","url":"https://modrinth.com/user/PizzaEight"},"hover_event":{"action":"show_text","value":[{"text":"open modrinth","color":"#45B305"}]},"bold":false,"color":"#45B305","text":"[Modrinth]"}]
tellraw @s {"bold":true,"color":"gold","text":"============================================="}
tellraw @s [{"text":"            "},{"bold":true,"color":"gold","text":"▶"},{"text":"[Click Here For Config Screen]","bold":true,"color":"gold","click_event":{"action":"run_command","command":"/trigger config"},"hover_event":{"action":"show_text","value":[{"text":"open config screen","color":"yellow"}]}},{"bold":true,"color":"gold","text":"◀"}]
tellraw @s [{"color":"aqua","text":"For the Config Screen type: "},{"color":"gold","text":"/trigger config"}]
tellraw @s [{"color":"aqua","text":"For the Corpse Finder Screen type: "},{"color":"gold","text":"/trigger corpse_finder"}]
tellraw @s [{"color":"red","text":"Both commands can be disabled in the config screen"}]
tellraw @s {"bold":true,"color":"gold","text":"============================================="}
