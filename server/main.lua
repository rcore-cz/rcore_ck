function checkAllowedTable()
    if tableLength(Config.AllowedModules) == 0 then
        dbg.critical('Config.AllowedModules cant be empty!')
        return false
    end

    local anyAllowed = false
    for procName, allowed in pairs(Config.AllowedModules) do
        if allowed then
            anyAllowed = true
            break
        end
    end

    if anyAllowed == false then
        dbg.critical("Config.AllowedModules must have at least one module turn on!")
        return
    end

    return true
end

RegisterCommand('ck', function(source,args)
    if not checkAllowedTable() then
        return
    end

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
        if Config.AllowedModules[process.name] == nil or Config.AllowedModules[process.name] == false then
            dbg.info('Skipping process %s', process.name)
        else
            dbg.info('Starting process %s', process.name)
            for _, call in pairs(process.process) do
                local ok, err = pcall(call, tostring(args[1]))
                if not ok then
                    dbg.critical('Process %s has error %s', process.name, err)
                end
            end
        end
    end
end)
