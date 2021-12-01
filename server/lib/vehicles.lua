--Bank settings removal
function deleteOwnerVehicles(identifier)
    dbg.info('[VEHICLES] Removing owned_vehicles from owner')
    MySQL.Sync.execute('DELETE FROM owned_vehicles WHERE owner=@identifier AND job=@none', {
        ['identifier'] = identifier,
        ['none'] = 'none'
    })
end

appendProcess({
    name = 'Vehicles',
    process = {
        deleteOwnerVehicles,
    },
})
