
foreach($line in Get-Content .\rechnerlist.txt) {

if ($line.Length -le 1) {
  Write-Host "Eintrag in Zeile kürzer als 1"
  $out = $line + " Eintrag kuerzer als 1, überspringe eintrag!"
  "---" | Out-file -Append -FilePath .\rechnerlist_out.txt
  $out | Out-file -Append -FilePath .\rechnerlist_out.txt
  "---" | Out-file -Append -FilePath .\rechnerlist_out.txt
  continue
}

write-host "Processing:" $line

if (-not (Test-Connection -ComputerName $line -Quiet)){
 Write-Host "Host nicht erreichbar!"
 $out = $line + " Host nicht erreichbar" 
 "---" | Out-file -Append -FilePath .\rechnerlist_out.txt
 $out | Out-file -Append -FilePath .\rechnerlist_out.txt
 "---" | Out-file -Append -FilePath .\rechnerlist_out.txt
 continue
}

"-----------------" | Out-File -Append .\rechnerlist_out.txt
$line | Out-File -Append .\rechnerlist_out.txt
getmac /v /s $line | Out-File -append .\rechnerlist_out.txt
#write-host $gettedmac

"-----------------" | Out-File -Append .\rechnerlist_out.txt
}
Write-Host "Datei gefüllt, bitte schauen unter .\rechnerlist_out.txt"
