$paths = "Path1","Path2"

while ($true) {

    $search = Read-Host "Enter file name to search for"
    Get-ChildItem $paths -Recurse -ErrorAction SilentlyContinue |
        Where-Object { -not $_.PSIsContainer -and $_.Name -like "*$search*" } |
        Select-Object FullName |
        Format-Table -AutoSize

    $again = Read-Host "Search Again? (Y/N)"

    if ($again -match '^[Yy]$') {
        Clear-Host
        }


    if ($again -match '^[Nn]$') {
        break
        }
    }
