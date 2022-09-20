import pymysql


def mysqlconnect():

    connection = pymysql.Connect(host='cs1.ucc.ie',
            user='mw17', 
            password ="wivie",
            db='cs2208_mw17')

    with connection:
        with connection.cursor() as cursor:          
            sql = "insert into OrderList values(0, 23, 'whatever3', 'whatever2', 3, 0)"             
            cursor.execute(sql)

            connection.commit()

mysqlconnect()