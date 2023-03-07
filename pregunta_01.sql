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
cur.execute(
    """
SELECT
    sum(c12)
FROM
    tbl1
"""
).fetchall()
