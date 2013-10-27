# Get the day month year 
$Day = Get-Date -Format %d 
$Month = Get-Date -Format MMMM 
$Year = Get-Date -Format yyyy 
$Name = $env:COMPUTERNAME 
$Share = "\\SVR\IT\Event Logs\" 

# Grab the eventlog, save it, clear it
$logfile = Get-WmiObject -Class win32_NTEventlogFile  | Where-Object { $_.logFileName -eq 'Application' }
$logfile.BackupEventlog("$Share" + "$Name\" + "$Year\" + "$Month\" + "EV-App-" + "$Day" + ".evt")
Clear-EventLog -LogName Security

$logfile = Get-WmiObject -Class win32_NTEventlogFile  | Where-Object { $_.logFileName -eq 'Security' }
$logfile.BackupEventlog("$Share" + "$Name\" + "$Year\" + "$Month\" + "EV-Sec-" + "$Day" + ".evt")
Clear-EventLog -LogName Security

$logfile = Get-WmiObject -Class win32_NTEventlogFile  | Where-Object { $_.logFileName -eq 'System' }
$logfile.BackupEventlog("$Share" + "$Name\" + "$Year\" + "$Month\" + "EV-Sys-" + "$Day" + ".evt")
Clear-EventLog -LogName Security