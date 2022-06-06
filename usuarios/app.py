import web
import sqlite3
import hashlib

urls = (
    "/", "Index",
    "/inicio_sesion_seguro", "IniciarSesionSeguro",
    "/inicio_sesion_inseguro", "IniciarSesionInseguro",
    "/bienvenida", "Bienvenida",
)
app = web.application(urls, globals())
render = web.template.render("templates/", base="layout")


class Index:
    def GET(self):
        return render.index()


class Bienvenida:
    def GET(self):
        return render.bienvenida()


class IniciarSesionSeguro:
    def GET(self):
        try:
            mensaje = None
            return render.inicio_sesion_seguro(mensaje)  # Retorna el resultado
        except Exception as e:
            print(e)
            mensaje = "Ups algo salio muy mal"
            return render.inicio_sesion_seguro(mensaje)

    def POST(self):
        try:
            mensaje = None
            form = web.input()  # Obtiene los datos del formulario
            email = form.email  # Obtiene el email
            password = form.password  # Obtiene el password
            password = hashlib.md5(password.encode()) # Encripta el password
            password = password.hexdigest()  # Parsea el password
            print(email, password) # Imprime los datos
            # Verifica si el usuario existe
            conexion = sqlite3.connect("usuarios.db") # Conecta con la base de datos
            conexion.row_factory = sqlite3.Row # Establece el row factory
            cursor = conexion.cursor() # Crea un cursor
            result = cursor.execute(
                "select count(usuarios.uid) as auth from usuarios where usuarios.email=? and usuarios.password=? and usuarios.status='activo';",
                (email, password),
            )
            result = result.fetchall()[0]["auth"] # Obtiene el primer registro
            if result == 0: # Si es 0, no existe el usuario
                mensaje = "Verifique usuario y contraseña"
                return render.inicio_sesion_seguro(mensaje)  # Retorna el resultado
            if result == 1: # Si es 1, existe el usuario
                mensaje = "El usuario es valido"
                return web.seeother("/bienvenida")
        except Exception as e:
            print(e)
            mensaje = "Ups algo salio muy mal"
            return render.inicio_sesion_seguro(mensaje)


class IniciarSesionInseguro:
    def GET(self):
        try:
            mensaje = None
            return render.inicio_sesion_inseguro(mensaje)  # Retorna el resultado
        except Exception as e:
            print(e)
            mensaje = "Ups algo salio muy mal"
            return render.inicio_sesion_inseguro(mensaje)

    def POST(self):
        try:
            mensaje = None
            form = web.input()  # Obtiene los datos del formulario
            email = form.email  # Obtiene el email
            password = form.password  # Obtiene el password
            password = hashlib.md5(password.encode()) # Encripta el password
            password = password.hexdigest()  # Parsea el password
            print(email, password) # Imprime los datos
            # Verifica si el usuario existe
            conexion = sqlite3.connect("usuarios.db") # Abre la conexion
            conexion.row_factory = sqlite3.Row # Establece el row factory
            cursor = conexion.cursor() # Obtiene el cursor
            # ejecuatar una consulta concatenando los valores de los campos la vuelve vulnerable a inyeccion de sql
            result = cursor.execute(
                "select count(usuarios.uid) as auth from usuarios where usuarios.email='"
                + email
                + "' and usuarios.password='"
                + password
                + "' and usuarios.status='activo';"
            )
            result = result.fetchall()[0]["auth"] # Obtiene el primer registro
            if result == 0: # Si es 0, no existe el usuario
                mensaje = "Verifique usuario y contraseña"
                return render.inicio_sesion_inseguro(mensaje)  # Retorna el resultado
            if result == 1: # Si es 1, existe el usuario
                mensaje = "El usuario es valido"
                return web.seeother("/bienvenida")
        except Exception as e:
            print(e)
            mensaje = "Ups algo salio muy mal"
            return render.inicio_sesion_inseguro(mensaje)


if __name__ == "__main__":
    app.run()
