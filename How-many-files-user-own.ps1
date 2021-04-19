[String]$nazwa = whoami
[String]$plikwyjsciowy = "pliki.csv"
[int]$a
$path = Get-ChildItem "c:\" -Recurse
Foreach( $file in $path ) {
  $f = Get-Acl $file.FullName
  if( $f.Owner -eq $nazwa ) {
    Write-Host( "{0}"-f $file.FullName | Out-File `
      -Encoding "UTF8" `
      -FilePath $plikwyjsciowy -Append)
      $a+=1
  }
}
Write-Output $a