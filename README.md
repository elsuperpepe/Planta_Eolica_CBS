# 🔍 Pentest Planta Eólica CBS - Proyecto Completo

![Pentest](https://img.shields.io/badge/Pentest-Professional-blue)
![OWASP](https://img.shields.io/badge/OWASP-Juice%20Shop-orange)
![Security](https://img.shields.io/badge/Security-Red%20Team-red)

## 🎯 Descripción del Proyecto

Pentesting completo de un sistema SCADA simulado (Planta Eólica) utilizando **OWASP Juice Shop** como objetivo principal. Este proyecto demuestra habilidades avanzadas en pruebas de penetración, desde reconocimiento hasta mitigaciones.

### 🏆 Objetivos Cumplidos
- ✅ **Fase 01**: Reconocimiento y enumeración de servicios
- ✅ **Fase 02**: Ataques automatizados (SQLi, Fuerza Bruta)
- ✅ **Fase 03**: Mitigaciones específicas y documentación profesional
- ✅ **Documentación**: Reportes ejecutivos y técnicos completos

## 📁 Estructura del Proyecto

Pentest_Planta_Eolica_CBS/
├── ANALISIS_DATOS
│   └── analisis
│       ├── Data_loader.py
│       ├── Data_processing.py
│       ├── Main.py
│       ├── __pycache__
│       │   ├── Data_loader.cpython-313.pyc
│       │   ├── Data_loader.cpython-314.pyc
│       │   ├── Data_processing.cpython-313.pyc
│       │   ├── Data_processing.cpython-314.pyc
│       │   ├── UI_Menu.cpython-313.pyc
│       │   ├── UI_Menu.cpython-314.pyc
│       │   ├── UI_Tables.cpython-313.pyc
│       │   └── UI_Tables.cpython-314.pyc
│       ├── Registros_Sistema_IDS.csv
│       ├── UI_Menu.py
│       └── UI_Tables.py
├── DOCUMENTACION_GENERAL
│   └── EVIDENCIAS
│       ├── capturas_pantalla
│       │   ├── Mitigaciones.jpeg
│       │   ├── Screenshot From 2025-10-29 03-27-56.png
│       │   ├── Screenshot From 2025-10-29 03-41-36.png
│       │   ├── Screenshot From 2025-10-29 03-59-50.png
│       │   └── Screenshot From 2025-10-29 04-19-55.png
│       └── logs_ataques
│           ├── hydra.txt
│           ├── sqli.txt
│           └── token_evidencia.txt
├── FASE_1_PORTSCAN
│   ├── escaneo_estructurado.txt.xml
│   └── puertos_abiertos.txt
├── FASE_2_ATAQUE
│   ├── fuerza_brute_ssh
│   │   ├── diccionarios
│   │   │   ├── passwords.txt
│   │   │   ├── pentest_attack.sh
│   │   │   └── usuarios.txt
│   │   └── pentest_attack.sh
│   └── SQL_Injection
│       ├── sqli.txt
│       └── token_evidencia.txt
├── FASE_3_MITIGACIONES
│   └── mitigaciones_especificas.sh
└── README.md

14 directories, 32 files


## 🚀 Scripts Principales

### 🔥 `pentest_attack.sh` - Script de Ataque Automatizado
```bash
# Uso: ./pentest_attack.sh <IP_TARGET>
./pentest_attack.sh 192.168.133.131


Funcionalidades:

    🔍 Portscan automático con Nmap

    🔑 Fuerza bruta SSH con Hydra

    🗃️ SQL Injection manual con output detallado

    🌐 Verificación de servicios web

    📊 Reporte automático de resultados



🛡️  mitigaciones_especificas.sh - Script de Mitigación
# Uso: sudo ./bloqueo_ataques.sh
sudo ./bloqueo_ataques.sh

Protecciones implementadas:

    🔐 Bloqueo SQL Injection (' OR 1=1--)

    🚫 Fail2Ban agresivo (1 intento = 24h bloqueo)

    🔥 Firewall UFW configurado

    ⚡ Rate limiting para servicios web

🐍 ANÁLISIS DE DATOS CON PYTHON TKINTER
Aplicativo Interactivo de Análisis de Seguridad

Desarrollamos una aplicación completa en Python con Tkinter para analizar registros de sistemas IDS (Intrusion Detection System) de la planta eólica.
📊 Módulos Principales:

Main.py - Aplicación Principal
Data_loader.py - Carga Inteligente de Datos
UI_Menu.py - Interfaz Gráfica Interactiva

🎯 Funcionalidades del Analizador:

    📈 Dashboard Interactivo: Visualización de eventos de seguridad

    🔍 Filtros Avanzados: Búsqueda por tipo de ataque, IP, severidad

    📊 Gráficas en Tiempo Real: Análisis temporal de incidentes

    🛡️ Clasificación de Amenazas: Categorización automática

    📋 Reportes Exportables: Generación de informes ejecutivos

🚀 Ejecución del Analizador:

cd ANALISIS_DATOS/analisis
python Main.py

📈 Métricas Analizadas:

    Frecuencia de ataques por hora

    IPs más maliciosas

    Tipos de ataques más comunes

    Patrones temporales de intrusiones

    Severidad y criticidad de eventos

🎯 Evidencias de Explotación Exitosa

    SQL Injection Comprometido

        Token de administrador obtenido

        Bypass completo de autenticación

        Acceso a cuenta admin@juice-sh.op

    Credenciales por Defecto

        Login exitoso con admin@juice-sh.op:admin123

        Acceso administrativo completo

    Reconocimiento de Servicios

        SSH (22/tcp) - OpenSSH 9.2p1

        HTTP (3000/tcp) - OWASP Juice Shop

🛠️ Tecnologías y Herramientas Utilizadas
🔧 Herramientas de Pentesting

    Nmap - Escaneo de puertos y servicios

    Hydra - Fuerza bruta SSH

    cURL - Testing de aplicaciones web

    OWASP Juice Shop - Entorno de pruebas

📋 Metodologías Aplicadas

    OSSTMM - Metodología de testing de seguridad

    OWASP Testing Guide - Guía de testing web

    Kali Linux Methodology - Enfoque estructurado

🎓 Habilidades Demostradas
🔍 Técnicas de Reconocimiento

    Enumeración de servicios y versiones

    Identificación de vectores de ataque

    Análisis de superficie de ataque

💣 Técnicas de Explotación

    SQL Injection manual y automatizado

    Fuerza bruta con diccionarios personalizados

    Bypass de autenticación

    Manipulación de parámetros web

🛡️ Técnicas de Mitigación

    Hardening de servicios (SSH)

    Configuración de WAF básico

    Implementación de rate limiting

    Sistema de detección de intrusos


🚀 Cómo Ejecutar el Proyecto
Prerrequisitos

# Herramientas necesarias
sudo apt update
sudo apt install nmap hydra curl jq -y


Ejecución Completa
# 1. Clonar repositorio
git clone https://github.com/elsuperpepe/Pentest_Planta_Eolica_CBS.git
cd Pentest_Planta_Eolica_CBS

# 2. Ejecutar ataque (desde FASE_2_ATAQUE/fuerza_brute_ssh/)
./pentest_attack.sh 192.168.133.131

# 3. Aplicar mitigaciones (desde FASE_3_MITIGACIONES/)
sudo ./bloqueo_ataques.sh


🏆 Logros Destacados

    ✅ Desarrollo de scripts profesionales de pentesting

    ✅ Documentación técnica completa y ejecutiva

    ✅ Metodología estructurada y repetible

    ✅ Evidencias sólidas de vulnerabilidades críticas

    ✅ Mitigaciones efectivas y específicas

👨‍💻 Autor

ElPepe - GitHub Profile

    "La seguridad no es un producto, sino un proceso continuo de mejora y adaptación."


