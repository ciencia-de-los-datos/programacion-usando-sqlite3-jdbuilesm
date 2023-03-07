-- 
--  La tabla `tbl1` tiene la siguiente estructura:
-- 
--    K0  CHAR(1)
--    K1  INT
--    c12 FLOAT
--    c13 INT
--    c14 DATE
--    c15 FLOAT
--    c16 CHAR(4)
--
--  Escriba una consulta en SQL que devuelva la suma del campo c12.
-- 
--  Rta/
--     SUM(c12)
--  0  15137.63
--
--  >>> Escriba su codigo a partir de este punto <<<
--

import sqlite3

conn = sqlite3.connect(":memory:")  ## aca se indica el nombre de la db.
cur = conn.cursor()

import pandas as pd

tbl0 = pd.read_csv(
    "tbl0.csv",
    sep=",",
    thousands=None,
    decimal=".",
    encoding="latin-1",
    names=['K0', 'c01', 'c02', 'c03', 'c04']
)

tbl0.columns = [col.replace('-', '_') for col in tbl0.columns]

tbl0.to_sql(
    name="tbl0",
    con=conn,
    if_exists="replace",  # {‘fail’, ‘replace’, ‘append’}
)
tbl1 = pd.read_csv(
    "tbl1.csv",
    sep=",",
    thousands=None,
    decimal=".",
    encoding="latin-1",
    names=['K0', 'K1', 'c12', 'c13', 'c14', 'c15', 'c16']
)

tbl1.columns = [col.replace('-', '_') for col in tbl1.columns]

tbl1.to_sql(
    name="tbl1",
    con=conn,
    if_exists="replace",  # {‘fail’, ‘replace’, ‘append’}
)

tbl2 = pd.read_csv(
    "tbl2.csv",
    sep=",",
    thousands=None,
    decimal=".",
    encoding="latin-1",
    names=['K1', 'c21', 'c22', 'c23', 'c24', 'c25']
)

tbl2.columns = [col.replace('-', '_') for col in tbl2.columns]

tbl2.to_sql(
    name="tbl2",
    con=conn,
    if_exists="replace",  # {‘fail’, ‘replace’, ‘append’}
)


cur.execute(
    """
SELECT
    sum(c12)
FROM
    tbl1
"""
).fetchall()
