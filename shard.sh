

vtctlclient ApplySchema -sql-file transaction.sql user_foundation

vtctlclient ApplyVSchema -vschema_file transaction_log.json TestA


