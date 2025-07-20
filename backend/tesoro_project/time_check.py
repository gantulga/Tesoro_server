from django.db import connection
with connection.cursor() as cursor:
    cursor.execute("SELECT NOW()")
    print(cursor.fetchone())