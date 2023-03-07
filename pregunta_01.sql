conn = sqlite3.connect(":memory:")  
cur = conn.cursor()



cur.execute(
    """
SELECT
    sum(c12)
FROM
    tbl1
"""
).fetchall()
