for row in cur.execute('SELECT SUM(c12) FROM tbl1'):
    print(row)
# Close connection to SQLite database
conn.close()
