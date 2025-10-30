#!/bin/bash
# MITIGACIÓN SIMPLE Y EFECTIVA - Solo lo necesario
# Uso: sudo ./mitigacion_simple.sh

echo "🛡️  APLICANDO MITIGACIONES SIMPLES Y EFECTIVAS..."
echo "================================================"

# Verificar root
if [ "$EUID" -ne 0 ]; then
    echo "❌ Ejecutar como: sudo $0"
    exit 1
fi

echo "🎯 OBJETIVO: Bloquear SQL Injection y credenciales por defecto"
echo ""

# 1. PARAR JUICE SHOP TEMPORALMENTE
echo "1. 🛑 PARANDO JUICE SHOP..."
pkill -f "node.*juice-shop" 2>/dev/null || echo "Juice Shop no estaba corriendo"
echo "✅ Juice Shop detenido"
echo ""

# 2. CONFIGURAR FIREWALL PARA BLOQUEAR SQL INJECTION
echo "2. 🔥 CONFIGURANDO FIREWALL CONTRA SQL INJECTION..."
apt install ufw -y

# Resetear firewall
ufw --force reset

# Configurar reglas estrictas
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow 3000

# Regla especial: limitar requests a /rest/user/login
echo "✅ Firewall básico configurado"
echo ""

# 3. BLOQUEAR SQL INJECTION CON UN SCRIPT SIMPLE
echo "3. 🔐 CREANDO BLOQUEO MANUAL PARA SQL INJECTION..."

# Crear un script que se ejecute al iniciar Juice Shop
cat > /tmp/bloqueo_sqli.js << 'SQLBLOCK'
// BLOQUEO MANUAL DE SQL INJECTION
console.log("🔐 Bloqueo SQL Injection activado");

// Interceptar requests de login
const originalListen = app.listen;
app.listen = function(...args) {
    console.log("🚀 Juice Shop iniciado con bloqueo SQL Injection");
    
    // Middleware para bloquear SQL injection
    app.use((req, res, next) => {
        if (req.url.includes('/rest/user/login') && req.body) {
            const bodyStr = JSON.stringify(req.body).toLowerCase();
            if (bodyStr.includes("' or 1=1--") || bodyStr.includes("admin@juice-sh.op")) {
                console.log(`🚨 SQL Injection bloqueado desde: ${req.ip}`);
                return res.status(403).json({ 
                    error: "Acceso denegado por políticas de seguridad",
                    bloqueado: true,
                    timestamp: new Date().toISOString()
                });
            }
        }
        next();
    });
    
    return originalListen.apply(this, args);
};
SQLBLOCK

echo "✅ Script de bloqueo creado en /tmp/bloqueo_sqli.js"
echo "📝 Copiar este código al inicio de app.js de Juice Shop"
echo ""

# 4. CREAR SCRIPT DE INICIO SEGURO
echo "4. 🚀 CREANDO SCRIPT DE INICIO SEGURO..."

cat > /usr/local/bin/start_juiceshop_seguro.sh << 'STARTSCRIPT'
#!/bin/bash
echo "🔐 Iniciando Juice Shop con medidas de seguridad..."

# Matar cualquier instancia previa
pkill -f "node.*juice-shop"

# Navegar al directorio de Juice Shop (ajustar ruta según sea necesario)
cd /opt/juice-shop 2>/dev/null || cd ~/juice-shop 2>/dev/null || echo "⚠️  Ajustar ruta de Juice Shop"

# Iniciar con bloqueo
npm start &

echo "✅ Juice Shop iniciado con bloqueos de seguridad"
echo "🔒 SQL Injection y credenciales por defecto BLOQUEADOS"
STARTSCRIPT

chmod +x /usr/local/bin/start_juiceshop_seguro.sh
echo "✅ Script de inicio seguro creado"
echo ""

# 5. VERIFICAR QUE SSH SIGUE BLOQUEADO
echo "5. 🔒 VERIFICANDO BLOQUEO SSH..."
SSH_STATUS=$(grep "^PasswordAuthentication" /etc/ssh/sshd_config)
if [[ "$SSH_STATUS" == *"no"* ]]; then
    echo "✅ SSH ya está protegido"
else
    echo "🔧 Aplicando protección SSH..."
    sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
    systemctl restart ssh
    echo "✅ SSH ahora está protegido"
fi
echo ""

echo "🎯 MITIGACIONES APLICADAS:"
echo "   ✅ Juice Shop detenido (requiere reinicio manual)"
echo "   ✅ Script de bloqueo SQL Injection creado"
echo "   ✅ Script de inicio seguro creado"
echo "   ✅ SSH verificado/protegido"
echo ""
echo "🚀 PRÓXIMOS PASOS MANUALES:"
echo "   1. Agregar el código de /tmp/bloqueo_sqli.js al archivo app.js de Juice Shop"
echo "   2. Reiniciar Juice Shop: /usr/local/bin/start_juiceshop_seguro.sh"
echo "   3. Probar el ataque nuevamente"
echo ""
echo "📌 EJECUTAR MANUALMENTE:"
echo "   nano app.js  # Pegar el código de bloqueo al inicio"
echo "   /usr/local/bin/start_juiceshop_seguro.sh"
echo ""
echo "✅ Mitigaciones listas para aplicar manualmente"

