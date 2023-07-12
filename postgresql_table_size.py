import psycopg2


if __name__ == "__main__":
    try:
        url = "host='{0}' dbname='{1}' user='{2}' password='{3}'".format('localhost', 'postgres', 'postgres', '12345')


        conn = psycopg2.connect(url)


        cursor = conn.cursor()
        
        # Obtener el nombre de la base de datos
    cursor.execute("SELECT current_database();")
    database_name = cursor.fetchone()[0]
    print(f"Base de datos: {database_name}")

    # Obtener el nombre del usuario
    cursor.execute("SELECT current_user;")
    user_name = cursor.fetchone()[0]
    print(f"Usuario: {user_name}")
    


        sql = """
        SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';
    """

        cursor.execute(sql)
	
	
        for row in results:
        print(f"Tabla: {row[0]}")

        cursor.close()
    except (Exception, psycopg2.DatabaseError) as e:
        print(e)
