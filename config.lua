Config = {}
Config.Debug = true
Config.DebugLevel = {
    'INFO',
    'CRITICAL',
}

Config.BasicTables = {
    {
        table = 'addon_account_data',
        column = 'owner',
    },
    {
        table = 'addon_inventory_items',
        column = 'owner',
    },
    {
        table = 'billing',
        column = 'identifier',
    },
    {
        table = 'owned_properties',
        column = 'owner',
    },
    {
        table = 'datastore_data',
        column = 'owner',
    },
    {
        table = 'phone_users_contacts',
        column = 'identifier',
    },
    {
        table = 'phone_settings',
        column = 'hex',
    },
    {
        table = 'recipe_player',
        column = 'player',
    },
    {
        table = 'user_documents',
        column = 'owner',
    },
    {
        table = 'users',
        column = 'identifier',
    },
    {
        table = 'phone_gps',
        column = 'hex',
    },
    {
        table = 'phone_settings',
        column = 'hex',
    },
    {
        table = 'twitter_accounts',
        column = 'identifier',
    },
}
