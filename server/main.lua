RegisterCommand('ck', function(source,args)
    --Only from rcon
    if source ~= 0 then
        dbg.critical('Can be used only from console')
        return
    end

    if args[1] == nil or string.len(args[1]) < 3 then
        dbg.info('Use ck [identifier]')
        return
    end

    local processes = getProcess()

    for _, process in pairs(processes) do
        dbg.info('Starting process %s', process.name)
        for _, call in pairs(process.process) do
            local ok, err = pcall(call, tostring(args[1]))
            if not ok then
                dbg.critical('Process %s has error %s', process.name, err)
            end
        end
    end
end)
