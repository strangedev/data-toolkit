import mysql.connector

def connect_to(host, database, user, password):
    cnx = mysql.connector.connect(user='root', password='root',
                                host='database',
                                database='drausy-oct_07')
    cnx.autocommit = True
    return cnx

def run_processes(cnx, processes):
    cursor = cnx.cursor()
    try:
        for proc in processes:
            jobs, logs = proc(cursor)
            for msg in logs: print(msg)
            print(len(jobs), "jobs to do.")
            for job in jobs: 
                job(cursor)
                print(cursor.statement, f"[{cursor.rowcount} rows affected]")
            print("Done.")
    except Exception as e:
        print(e)
    finally:
        cursor.close()

