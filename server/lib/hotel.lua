--Deletes for rcore_hotel
function deleteHotel(identifier)
    local accounts = MySQL.Sync.fetchAll('SELECT * FROM hotels_rooms WHERE owner=@identifier', {
        ['identifier'] = identifier
    })

    if accounts then
        for _, account in pairs(accounts) do
            Wait(50)

            dbg.info('[HOTEL] Removing business from owner %s', account.id)
            MySQL.Sync.execute('UPDATE hotels_rooms SET owner=NULL WHERE owner=@identifier', {
                ['identifier'] = identifier,
            })
        end
    else
        dbg.critical('[HOTEL] Cannot find any bank accounts!')
    end
end

appendProcess({
    name = 'hotel',
    process = {
        deleteHotel,
    },
})
