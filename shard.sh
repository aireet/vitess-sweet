
vtctldclient ApplyVSchema --sql-file ./transaction.sql
vtctldclient ApplyVSchema --vschema-file ./shard.json user_bill