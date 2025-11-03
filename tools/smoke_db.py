import os
from dotenv import load_dotenv
import psycopg

# Load settings from configs/.env into environment
load_dotenv("configs/.env", override=True)

url = os.getenv("DATABASE_URL")
if not url:
    raise SystemExit("DATABASE_URL is missing. Set it in configs/.env")

# Open a short-lived connection and print basic info
with psycopg.connect(url) as conn:
    with conn.cursor() as cur:
        cur.execute("select current_user")
        who = cur.fetchone()[0]
        cur.execute("select current_database()")
        db = cur.fetchone()[0]
        cur.execute("select version()")
        ver = cur.fetchone()[0].splitlines()[0]

print(f"Connected OK as {who} to {db}")
print(ver)
