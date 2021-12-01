--Function will always get identifier attribute
function exampleFunction(identifier)
    dbg.info('[EXAMPLE] Removing something debug so we know what we doing')
    --MySQL.Sync.execute('DELETE FROM owned_vehicles WHERE owner=@identifier AND job=@none', {
    --    ['identifier'] = identifier,
    --    ['none'] = 'none'
    --})
end

--Appending process so script will know about that
appendProcess({
    name = 'example', --Use uniq name
    process = {
        exampleFunction,
    },
})
