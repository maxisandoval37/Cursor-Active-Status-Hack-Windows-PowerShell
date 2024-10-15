Add-Type -AssemblyName 'System.Windows.Forms'

# Definir constantes para la hora de inicio y de fin
$startHour = 9
$endHour = 18

function Write-Log {
    param (
        [string]$message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "$timestamp - $message"
    Write-Host $logMessage
}

function Toggle-ScrollLock {
    [System.Windows.Forms.SendKeys]::SendWait("{SCROLLLOCK}")
    Write-Log "Precionando: Scroll Lock."
}

Write-Log "Script iniciado."

while ($true) {
    Write-Log "Validando hora de inicio..."
    $currentTime = Get-Date
    if ($currentTime.Hour -ge $startHour) {
        Write-Log "Hora de inicio alcanzada: $currentTime"
        break
    }
    Start-Sleep -Seconds 60
}

while ($true) {
    $currentTime = Get-Date
    if ($currentTime.Hour -ge $endHour) {
        Write-Log "Hora de fin alcanzada: $currentTime. Entrando en modo espera."
        Start-Sleep -Seconds 600  # Espera 10 minutos y vuelve a comprobar la hora
        continue
    }
    Toggle-ScrollLock
    Start-Sleep -Seconds 60
}