--Bank settings removal
function deleteBankAccount(identifier)
    local accounts = MySQL.Sync.fetchAll('SELECT * FROM banking_accounts WHERE identifier=@identifier', {
        ['identifier'] = identifier
    })

    if accounts then
        for _, account in pairs(accounts) do
            Wait(50)

            dbg.info('[BANK] Deleting bank account %s', account.id)
            MySQL.Sync.execute('DELETE FROM banking_accounts WHERE identifier=@identifier', {
                ['identifier'] = identifier,
            })
        end
    else
        dbg.critical('[BANK] Cannot find any bank accounts!')
    end
end

appendProcess({
    name = 'Banking',
    process = {
        deleteBankAccount,
    },
})
