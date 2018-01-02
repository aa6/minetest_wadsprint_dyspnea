local sound_handlers = {}

minetest_wadsprint.api.events:on("dyspnea-on",
    function(event)
        sound_handlers[event.player.name] = minetest.sound_play(
            {
                name = "minetest_wadsprint_dyspnea_hardbreath",
            },
            {
                loop = true,
                object = event.player.obj,
            }
        )
    end
)

minetest_wadsprint.api.events:on("dyspnea-off",
    function(event)
        if sound_handlers[event.player.name] ~= nil then
            minetest.sound_stop(sound_handlers[event.player.name])
        end
    end
)


