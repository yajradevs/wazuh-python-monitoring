$BaseDir = "C:\WazuhMetrics"
$PythonInstaller = "$BaseDir\python-installer.exe"

if (!(Test-Path $BaseDir)) {
    New-Item -Path $BaseDir -ItemType Directory -Force
}

# Install Python if missing
if (!(Get-Command python.exe -ErrorAction SilentlyContinue)) {

    Invoke-WebRequest `
        -Uri "https://github.com/USERNAME/wazuh-python-monitoring/releases/download/v1/python-3.12.0-amd64.exe" `
        -OutFile $PythonInstaller

    Start-Process `
        -FilePath $PythonInstaller `
        -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1 Include_pip=1" `
        -Wait
}

# Upgrade pip
python -m pip install --upgrade pip

# Install required modules
python -m pip install psutil
python -m pip install speedtest-cli

# Download scripts
Invoke-WebRequest `
    -Uri "https://raw.githubusercontent.com/USERNAME/wazuh-python-monitoring/main/cpu_ram_metrics.py" `
    -OutFile "$BaseDir\cpu_ram_metrics.py"

Invoke-WebRequest `
    -Uri "https://raw.githubusercontent.com/USERNAME/wazuh-python-monitoring/main/internet_speed.py" `
    -OutFile "$BaseDir\internet_speed.py"