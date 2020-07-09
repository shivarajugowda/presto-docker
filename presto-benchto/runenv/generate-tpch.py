#!/usr/bin/env python

schemas = [
    # (new_schema, source_schema)
    ('tpch_tiny_orc', 'tpch.tiny'),
]

tables = [
    'customer',
    'lineitem',
    'nation',
    'orders',
    'part',
    'partsupp',
    'region',
    'supplier',
]

for (new_schema, source_schema) in schemas:

    if new_schema.endswith('_orc'):
        format = 'ORC'
    elif new_schema.endswith('_text'):
        format = 'TEXTFILE'
    else:
        raise ValueError(new_schema)

    print('CREATE SCHEMA hive.{};'.format(new_schema,))
    for table in tables:
        print('CREATE TABLE "hive"."{}"."{}" WITH (format = \'{}\') AS SELECT * FROM {}."{}";'.format(
              new_schema, table, format, source_schema, table))