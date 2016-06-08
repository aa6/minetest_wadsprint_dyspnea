local sound_handlers = {}

minetest_wadsprint.api.events:on("dyspnea",function(event)
    if event.value == true then
        sound_handlers[event.player.name] = minetest.sound_play(
            {
                loop = true,
                name = "minetest_wadsprint_dyspnea_hardbreath",
            },
            {
                object = event.player.obj,
            }
        )
    else
        if sound_handlers[event.player.name] ~= nil then
            minetest.sound_stop(sound_handlers[event.player.name])
        end
    end
end)