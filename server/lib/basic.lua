function deleteBasicTable(table, column, identifier)
    local sql = string.format('DELETE FROM `%s` WHERE `%s`=@identifier', table, column)
    MySQL.Sync.execute(sql, {
        ['identifier'] = identifier,
    })
    dbg.info('[BASIC] Deleting table %s by column %s', table, column)
end

function deleteAllBasics(identifier)
    for _, data in pairs(Config.BasicTables) do
        deleteBasicTable(data.table, data.column, identifier)
    end
end

appendProcess({
    name = 'basic',
    process = {
        deleteAllBasics,
    }
})
