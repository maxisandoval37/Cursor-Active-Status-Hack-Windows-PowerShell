Add-Type -AssemblyName 'System.Windows.Forms'

function Toggle-ScrollLock {
    [System.Windows.Forms.SendKeys]::SendWait("{SCROLLLOCK}")
}

while ($true) {
    Toggle-ScrollLock
    Start-Sleep -Seconds 60
}