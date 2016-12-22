$ripDir = "E:\Rips"

Get-ChildItem $ripDir |
Foreach-Object {
  $name = $_.Name
  $nameParts = $name.Split('_')
  $movieName = ''
  Foreach ($part in $nameParts) {
    if ($part -eq $nameParts[-1]) {
      $movieName = (Get-Culture).TextInfo.ToTitleCase($movieName)
      $movieName = $movieName + "(" + $part + ")"
    } else {
      $movieName = $movieName + $part + " "
    }
  }
  $movieName
}



# Start-Process "C:\Program Files\Handbrake\HandBrakeCLI.exe" -ArgumentList "-i `"$inFile`" -o `"$outFile`" -e x264" -Wait -NoNewWindow
