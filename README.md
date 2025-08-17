# 📱 App Básica - Gestión de Contactos

## 📋 Descripción del Proyecto

Este proyecto implementa una aplicación completa de gestión de contactos que incluye:
- **Backend**: API REST desarrollada en Node.js con Express y MongoDB
- **Frontend**: Aplicación móvil multiplataforma desarrollada en Flutter

La aplicación permite realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) sobre una base de datos de contactos personales.

## 🏗️ Arquitectura del Proyecto

```
Taller1/
├── api-rest-contactos/     # Backend - API REST
│   ├── config/            # Configuración de base de datos
│   ├── controllers/       # Lógica de negocio
│   ├── models/           # Modelos de datos (Mongoose)
│   ├── routes/           # Definición de rutas
│   ├── server.js         # Servidor principal
│   └── package.json      # Dependencias del backend
│
├── front/                # Frontend - Aplicación Flutter
│   ├── lib/
│   │   ├── controlador/  # Controladores para API
│   │   ├── modelo/       # Modelos de datos
│   │   ├── vista/        # Interfaces de usuario
│   │   └── main.dart     # Punto de entrada
│   ├── android/          # Configuración Android
│   ├── ios/              # Configuración iOS
│   ├── web/              # Configuración Web
│   ├── windows/          # Configuración Windows
│   └── pubspec.yaml      # Dependencias del frontend
│
├── .gitignore           # Archivos ignorados por Git
└── README.md            # Este archivo
```

## 🛠️ Tecnologías Utilizadas

### Backend (API REST)
- **Node.js**: Entorno de ejecución de JavaScript
- **Express.js**: Framework web para Node.js
- **MongoDB**: Base de datos NoSQL
- **Mongoose**: ODM para MongoDB
- **Middleware**:
  - `cors`: Manejo de CORS
  - `morgan`: Logging de peticiones HTTP
  - `body-parser`: Parsing de cuerpos de petición
  - `dotenv`: Manejo de variables de entorno

### Frontend (Aplicación Móvil)
- **Flutter**: Framework de desarrollo multiplataforma
- **Dart**: Lenguaje de programación
- **HTTP**: Para comunicación con la API REST
- **Material Design**: Sistema de diseño de Google

## 🚀 Instalación y Configuración

### Requisitos Previos
- Node.js (v14 o superior)
- npm o yarn
- Flutter SDK (v3.5.4 o superior)
- MongoDB (local o Atlas)
- Editor de código (VS Code recomendado)

### Configuración del Backend

1. **Navegar al directorio del backend**:
   ```bash
   cd api-rest-contactos
   ```

2. **Instalar dependencias**:
   ```bash
   npm install
   ```

3. **Configurar variables de entorno**:
   Crear archivo `.env` en la raíz del directorio del backend:
   ```env
   MONGO_URI=mongodb://localhost:27017/contactos
   PORT=5000
   ```

4. **Iniciar el servidor**:
   ```bash
   npm start
   ```
   El servidor estará disponible en `http://localhost:5000`

### Configuración del Frontend

1. **Navegar al directorio del frontend**:
   ```bash
   cd front
   ```

2. **Obtener dependencias de Flutter**:
   ```bash
   flutter pub get
   ```

3. **Verificar dispositivos disponibles**:
   ```bash
   flutter devices
   ```

4. **Ejecutar la aplicación**:
   ```bash
   flutter run
   ```

## 📊 API Endpoints

### Base URL: `http://localhost:5000/api`

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/personas` | Obtener todas las personas |
| POST | `/personas` | Crear una nueva persona |
| PUT | `/personas/:id` | Actualizar persona por ID |
| DELETE | `/personas/:id` | Eliminar persona por ID |

### Ejemplo de Estructura de Datos

```json
{
  "_id": "64f8a1b2c3d4e5f6a7b8c9d0",
  "nombre": "Juan",
  "apellido": "Pérez",
  "telefono": "+593987654321",
  "createdAt": "2024-01-15T10:30:00.000Z",
  "updatedAt": "2024-01-15T10:30:00.000Z"
}
```

## 📱 Funcionalidades de la Aplicación

### Backend Features
- ✅ API RESTful completa
- ✅ Conexión a MongoDB
- ✅ Validación de datos
- ✅ Manejo de errores
- ✅ Middleware de logging
- ✅ Soporte CORS

### Frontend Features
- ✅ Interfaz de usuario intuitiva
- ✅ Lista de contactos con scroll
- ✅ Formularios para crear/editar contactos
- ✅ Botones de acción (editar/eliminar)
- ✅ Validación de formularios
- ✅ Diseño responsivo
- ✅ Integración con API REST

## 🎨 Capturas de Pantalla

*[Aquí puedes agregar capturas de pantalla de la aplicación en funcionamiento]*

## 🔧 Desarrollo y Testing

### Scripts de Backend
```bash
# Desarrollo (con nodemon)
npm run dev

# Producción
npm start

# Testing
npm test
```

### Scripts de Frontend
```bash
# Ejecutar en modo debug
flutter run

# Ejecutar en modo release
flutter run --release

# Construir para Android
flutter build apk

# Construir para iOS
flutter build ios

# Ejecutar tests
flutter test
```

## 📝 Estructura de Archivos Principales

### Backend
- `server.js`: Configuración del servidor Express
- `config/database.js`: Conexión a MongoDB
- `models/Persona.js`: Modelo de datos para personas
- `controllers/personaController.js`: Lógica de negocio
- `routes/personaRoutes.js`: Definición de rutas

### Frontend
- `lib/main.dart`: Punto de entrada de la aplicación
- `lib/modelo/persona_modelo.dart`: Modelo de datos
- `lib/controlador/persona_controlador.dart`: Comunicación con API
- `lib/vista/persona_vista.dart`: Interfaz de usuario

## 🤝 Contribuciones

Para contribuir al proyecto:

1. Fork el repositorio
2. Crear una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -am 'Agregar nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Crear un Pull Request

## 📄 Licencia

Este proyecto es parte de un taller académico para el curso de Desarrollo de Aplicaciones Móviles.

## 👥 Equipo de Desarrollo

- **Grupo 1**
- Curso: Desarrollo de Aplicaciones Móviles
- Período: Octubre 2024 - Marzo 2025
- Parcial: Segundo

## 📞 Soporte

Para dudas o problemas:
1. Revisar la documentación
2. Verificar logs del servidor/aplicación
3. Consultar con el instructor del curso

---

## 🔍 Troubleshooting

### Problemas Comunes

**Backend no inicia:**
- Verificar que MongoDB esté ejecutándose
- Revisar variables de entorno en `.env`
- Verificar que el puerto 5000 esté disponible

**Frontend no conecta con API:**
- Verificar que el backend esté ejecutándose
- Revisar la URL en `persona_controlador.dart`
- Verificar permisos de internet en la aplicación

**Error de CORS:**
- Verificar configuración de CORS en `server.js`
- Asegurar que la URL del frontend esté permitida

---

*Última actualización: Agosto 2025*
