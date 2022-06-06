import sqlite3


class InicioSesion:
    def get_usuarios(self, offset: int = 0, limit: int = 10):
        try:
            with sqlite3.connect("usuarios.db") as connection:
                connection.row_factory = sqlite3.Row
                cursor = connection.cursor()
                result = cursor.execute(
                    "SELECT * FROM usuarios LIMIT ? OFFSET ?", (limit, offset)
                )
            return result.fetchall()
        except Exception as e:
            error = {"error": str(e)}
            return error

    def auth_usuario(self, email, password):
        try:
            with sqlite3.connect("usuarios.db") as connection:
                connection.row_factory = sqlite3.Row
                cursor = connection.cursor()

                result = cursor.execute(
                    "select count(usuarios.uid) as auth from usuarios where usuarios.email=? and usuarios.password=? and usuarios.status='activo';",
                    (email, password),
                )
            return result.fetchall()[0]["auth"]
        except Exception as e:
            error = {"error": str(e)}
            return error

    def auth_usuario2(self, email, password):
        try:
            with sqlite3.connect("usuarios.db") as connection:
                connection.row_factory = sqlite3.Row
                cursor = connection.cursor()

                result = cursor.execute(
                    "select count(usuarios.uid) as auth from usuarios where usuarios.email='"
                    + email
                    + "' and usuarios.password='"
                    + password
                    + "' and usuarios.status='activo';"
                )
            return result.fetchall()[0]["auth"]
        except Exception as e:
            error = {"error": str(e)}
            return error


inicio = InicioSesion()

print(inicio.auth_usuario("admin@email.com", "21232f297a57a5a743894a0e4a801fc3X")) # Protegido contra SQL Injection
print(inicio.auth_usuario2("admin@email.com'; --", "x")) # No protegido contra SQL Injection
print(inicio.auth_usuario("admin@email.com'; --", "x")) # Protegido contra SQL Injection
