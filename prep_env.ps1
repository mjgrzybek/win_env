Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y notepadplusplus doublecmd 7zip microsoft-windows-terminal --pre -y

# use notepad++ to open any textfile
cmd /c "ftype ""No Extension""=""notepad++.exe"" ""%1"""
foreach ($extension in @(".txt", ".log")) 
{ 
    $fileType = (cmd /c "assoc $extension") 
    $fileType = $fileType.Split("=")[-1]  
    cmd /c "ftype $fileType=""notepad++.exe"" ""%1""" 
}
cmd /c "ftype "".properties""=""notepad++.exe"" ""%1"""
