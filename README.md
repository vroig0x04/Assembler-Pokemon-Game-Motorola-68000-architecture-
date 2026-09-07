# Simulador de Batallas Pokémon - Motorola 68000

## 📋 Descripción del Proyecto

Este repositorio contiene la implementación completa de un **simulador de batallas Pokémon** desarrollado en **lenguaje ensamblador Motorola 68000 (M68K)**. El proyecto constituye una implementación educativa y funcional que replica las características principales del sistema de batalla Pokémon de primera generación, permitiendo batallas interactivas con gráficos y mecánicas en tiempo real.

El sistema implementa:

- **Sistema de batallas por turnos**: Gestión completa de turnos y ordem de ataque
- **Motor gráfico**: Renderización directa en pantalla de 320x240 píxeles
- **Mecánicas de Pokémon**: Estadísticas, movimientos y tipos de Gen I
- **Menú interactivo**: Navegación y selección de Pokémon
- **Efectos de sonido**: Integración de audio (opcional)
- **Generador de números aleatorios**: Para ataques y cálculos no determinísticos

---

**Disponible en otros idiomas:** [English](README.en.md)

## 🏗️ Composición del Proyecto

```
100% - Lenguaje Ensamblador Motorola 68000 (M68K)
```

Todos los módulos del proyecto están desarrollados íntegramente en ensamblador puro.

## 🛠️ Herramientas y Dependencias

### Requisitos del Sistema

El simulador requiere las siguientes herramientas:

| Herramienta | Propósito | Versión Mínima |
|------------|----------|---------------|
| **EASy68K** | IDE y ensamblador para Motorola 68000 | 5.0+ |
| **Emulador M68K** | Simulador de la arquitectura (incluido en IDE) | Compatible con M68K |
| **Recursos Multimedia** | Archivos de audio/temas (opcional) | Archivos WAV/MP3 |

### Configuración Recomendada

- **IDE**: EASy68K (altamente recomendado)
- **Memoria**: 512 KB mínimo para ejecución
- **Resolución**: 320x240 píxeles (estándar Motorola 68000)
- **Procesador**: Motorola 68000 o superior

## 📁 Estructura del Repositorio

```
Assembler-Pokemon-Game/
├── Módulo Principal
│   ├── MAIN.X68                     # Punto de entrada principal
│   ├── MAIN.S68                     # Versión extendida con comentarios
│   └── MAIN.L68                     # Listado de ensamblaje (160 KB)
│
├── Sistema de Interfaz
│   ├── MENU.X68                     # Gestión del menú principal
│   ├── SYSMENU.X68                  # Rutinas de sistema para menú
│   ├── LOADSCREEN.X68               # Pantalla de carga
│   └── THEMES.X68                   # Gestión de temas visuales y audio
│
├── Sistema de Batalla
│   └── SYSBATTLE.X68                # Motor de batallas (19 KB)
│
├── Datos y Configuración
│   ├── CONST.X68                    # Constantes globales y tablas (8 KB)
│   ├── SYSCONST.X68                 # Constantes del sistema
│   ├── VARS.X68                     # Variables de juego
│   └── SYSVARS.X68                  # Variables del sistema
│
├── Utilidades
│   ├── SYSTEM.X68                   # Funciones del sistema
│   ├── FILEREADER.X68               # Lector de archivos
│   ├── RANDOM.X68                   # Generador de números aleatorios
│   └── SYSEND.X68                   # Rutinas de finalización
│
├── README.md                        # Este archivo
├── README.en.md                     # Versión en inglés
└── README.txt                       # Información adicional
```

## 🚀 Guía de Uso

### 1. Preparación Inicial

Clone el repositorio:

```bash
git clone https://github.com/vroig0x04/Assembler-Pokemon-Game-Motorola-68000-architecture-.git
cd Assembler-Pokemon-Game-Motorola-68000-architecture-
```

### 2. Configuración de EASy68K

1. Abre **EASy68K**
2. Ve a **File → Open** y selecciona **MAIN.X68**
3. Asegúrate de que todos los archivos `.X68` están en el mismo directorio
4. El IDE cargará automáticamente las dependencias

### 3. Compilación del Ensamblador

Para compilar el código ensamblador:

```
1. Compile → Assemble (Ctrl+F9)
2. Si no hay errores, el ensamblador generará el código objeto
```

### 4. Ejecución del Simulador

Para ejecutar el simulador:

```
1. Run → Execute (F10)
2. El emulador Motorola 68000 iniciará el juego
3. La pantalla mostrará la interfaz del juego
```

### 5. Configuración de Multimedia (Opcional)

Para incluir archivos de audio:

1. Descarga la carpeta `themes` desde el enlace Drive:
   ```
   https://drive.google.com/drive/folders/1o9xBbEUSeAxfoxZciXyP3HjyqYmeXVGO?usp=sharing
   ```
2. Reemplaza la carpeta `themes` vacía del proyecto
3. El juego cargará automáticamente los archivos de audio

## 🎮 Controles del Juego

| Control | Acción |
|---------|--------|
| **← →** | Desplazarse en el menú |
| **Z** | Atacar durante la batalla |
| **X** | Reiniciar el juego |
| **Espacio** | Salir (después de perder) |

## 🔧 Fases y Componentes

### Fase 1: Carga y Menú
Realizado por **MENU.X68** y **LOADSCREEN.X68**, gestiona:
- Pantalla de inicio
- Menú de selección
- Carga de recursos

### Fase 2: Selección de Pokémon
Implementado en **MAIN.X68**, permite:
- Seleccionar equipo de batalla
- Visualizar estadísticas
- Confirmar selección

### Fase 3: Sistema de Batalla
Realizado por **SYSBATTLE.X68** (19 KB), incluye:
- Cálculo de daño
- Gestión de turnos
- Animaciones de ataque
- Determinación de victoria/derrota

### Fase 4: Gestión de Datos
Implementado en módulos de datos:
- **CONST.X68**: Estadísticas de Pokémon Gen I
- **VARS.X68**: Estado actual del juego
- **RANDOM.X68**: Generador de números aleatorios

## 📊 Características Principales

### Sistema de Batalla
✅ Turnos alternados basados en velocidad  
✅ Cálculo de daño según movimiento y estadísticas  
✅ Sistema de tipos y efectividad  
✅ Condiciones de victoria/derrota  
✅ Animaciones en tiempo real

### Generación I Pokémon
✅ Todos los Pokémon de Gen I incluidos  
✅ Estadísticas completas (HP, ATK, DEF, etc.)  
✅ Movimientos de primera generación  
✅ Gráficos basados en sprites de 8 bits  
✅ Sistema de tipos completo

### Optimizaciones de Ensamblador
✅ Código modular y reutilizable  
✅ Gestión eficiente de registros  
✅ Acceso rápido a tablas de datos  
✅ Rutinas de sistema independientes  
✅ Extensos comentarios en el código

## 🧪 Casos de Prueba

El repositorio incluye código de prueba en los archivos:

- **MAIN.S68**: Versión comentada completa para depuración
- **README.txt**: Información adicional de configuración

## ⚠️ Licencia y Derechos de Autor

Este software es propiedad intelectual de **Vicent Roig**. La copia, modificación o distribución no autorizada de este archivo, por cualquier medio, está estrictamente prohibida.

## 🤝 Contribuciones

Las contribuciones no son aceptadas en este momento dado el carácter propietario del proyecto.

## 📞 Contacto

Para consultas relacionadas con este proyecto, contacte al propietario del repositorio.

---

**Última actualización:** Septiembre 2026  
**Versión del Simulador:** 1.0  
**Arquitectura:** Motorola 68000 (M68K)
