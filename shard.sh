
vtctldclient ApplySchema --sql-file transaction.sql user_foundation


vtctldclient ApplyVSchema --vschema-file ./shard.json  user_foundation