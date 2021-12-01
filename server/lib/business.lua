--Bank settings removal
function deleteBusiness(identifier)
    local accounts = MySQL.Sync.fetchAll('SELECT * FROM business WHERE owner=@identifier', {
        ['identifier'] = identifier
    })

    if accounts then
        for _, account in pairs(accounts) do
            Wait(50)

            dbg.info('[BUSINESS] Removing business from owner %s', account.id)
            MySQL.Sync.execute('UPDATE business SET owner=NULL WHERE identifier=@identifier', {
                ['identifier'] = identifier,
            })
        end
    else
        dbg.critical('[BUSINESS] Cannot find any bank accounts!')
    end
end

appendProcess({
    name = 'Business',
    process = {
        deleteBusiness,
    },
})
