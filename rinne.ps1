echo Sau đây là thông tin-
net start Audiosrv | Out-Null
net user $env:UserName "Quanvarin23" | Out-Null
write-host Username: $env:UserName
write-host Password: Quanvarin23
echo Đang lấy IP...
Start-BitsTransfer -Source "https://qemu.weilnetz.de/w64/2023/qemu-w64-setup-20230414.exe" -Destination "qemu_setup.exe" -Description "Downloading additional files..."
.\qemu_setup.exe /S | Out-Null
Remove-Item .\qemu_setup.exe -Force | Out-Null
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0 | Out-Null
Enable-NetFirewallRule -DisplayGroup "Remote Desktop" | Out-Null
Invoke-WebRequest https://github.com/Vichingo455/GitHub-RDP-NGROK/blob/master/ngrok.exe?raw=true
.\ngrok.exe config add-authtoken 2MwTQ2vL3WGT7QSnd9QcBD3eE7D_S8T2mYhRs4KnCR7aQKmk | Out-Null
.\ngrok.exe tcp 3389 | Out-Null
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Không thể truy xuất NGROK authtoken - hãy kiểm tra lại authtoken của bạn"
ping -t localhost
