from afiapi import app

# Start gunicorn: gunicorn --workers 3 --bind unix:/tmp/afi.sock -m 007 wsgi:app
# gunicorn --workers 3 --bind unix:/usr/local/var/run/afi.sock -m 007 --access-logfile - --error-logfile - --log-level debug wsgi:app
# gunicorn --workers 3 --bind unix:/usr/local/var/run/afi.sock -m 007 wsgi:app

if __name__ == "__main__":
    app.run()