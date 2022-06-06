# Modicacion
import web
import sqlite3
import hashlib

urls = (
    "/", "Index",
    "/inicio_sesion_seguro", "IniciarSesionSeguro",
    "/inicio_sesion_inseguro", "IniciarSesionInseguro",
    )
app = web.application(urls, globals())
render = web.template.render("templates/", base="layout")


class Index:
    def GET(self):
        return render.index()


class IniciarSesionSeguro:
    def GET(self):
        mensaje = None
        return render.inicio_sesion_seguro(mensaje) # Retorna el resultado

    def POST(self):
        mensaje = None
        form = web.input() # Obtiene los datos del formulario
        email = form.email # Obtiene el email
        password = form.password # Obtiene el password
        password = hashlib.md5(password.encode())
        password = password.hexdigest() # Encripta el password
        print(email, password)
        # Verifica si el usuario existe
        conexion = sqlite3.connect("usuarios.db")
        conexion.row_factory = sqlite3.Row
        cursor = conexion.cursor()
        result = cursor.execute("select count(usuarios.uid) as auth from usuarios where usuarios.email=? and usuarios.password=? and usuarios.status='activo';",(email, password))
        result = result.fetchall()[0]["auth"]
        if result == 0:
            mensaje = "Verifique usuario y contraseña"
        if result == 1:
            mensaje = "El usuario es valido"
        return render.inicio_sesion_seguro(mensaje) # Retorna el resultado

class IniciarSesionInseguro:
    def GET(self):
        mensaje = None
        return render.inicio_sesion_inseguro(mensaje) # Retorna el resultado

    def POST(self):
        mensaje = None
        form = web.input() # Obtiene los datos del formulario
        email = form.email # Obtiene el email
        password = form.password # Obtiene el password
        password = hashlib.md5(password.encode())
        password = password.hexdigest() # Encripta el password
        print(email, password)
        # Verifica si el usuario existe
        conexion = sqlite3.connect("usuarios.db")
        conexion.row_factory = sqlite3.Row
        cursor = conexion.cursor()
        # ejecuatar una consulta concatenando los valores de los campos la vuelve vulnerable a inyeccion de sql
        result = cursor.execute("select count(usuarios.uid) as auth from usuarios where usuarios.email='" + email + "' and usuarios.password='" + password +"' and usuarios.status='activo';")
        result = result.fetchall()[0]["auth"]
        if result == 0:
            mensaje = "Verifique usuario y contraseña"
        if result == 1:
            mensaje = "El usuario es valido"
        return render.inicio_sesion_inseguro(mensaje) # Retorna el resultado


if __name__ == "__main__":
    app.run()
