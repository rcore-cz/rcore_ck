dbg = rdebug()
dbg.setupPrefix(GetCurrentResourceName())

local processes = {}

function appendProcess(process)
    dbg.info('Appending process %s', process.name)
    table.insert(processes, process)
end

function getProcess()
    return processes
end
