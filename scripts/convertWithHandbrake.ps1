$dvdQuality = 18
$brQuality = 20

$outputExt = "mkv"

$baseDrive = "E:"

$baseRipDir = "$baseDrive\Rips"

$dvdRipDir = "$baseRipDir\dvd\"
$brRipDir = "$baseRipDir\br\"

$outputDir = "$baseDrive\Conversions"

$doneDir = "$baseDrive\Converted"

$ripInfos = @(@($dvdRipDir,$dvdQuality),@($brRipDir,$brQuality))

foreach ($ripInfo in $ripInfos) {
  $ripDir = $ripInfo[0]
  $ripQuality = $ripInfo[1]
  if ((Test-Path $ripDir) -eq 0) {
    Write-Host "Path $ripDir does not exist!"
    continue
  }
  if ((Test-Path -Path $ripDir\*) -eq 0) {
    Write-Host "Path $ripDir contains no rips to process."
    continue
  }
  Get-ChildItem $ripDir | ForEach-Object {
    $mkvRipDir = "$ripDir$_"
    $ripName = $_.Name
    $nameParts = $ripName.Split('_')
    $outputFileName = ''
    Foreach ($part in $nameParts) {
      if ($part -eq $nameParts[-1]) {
        $outputFileName = (Get-Culture).TextInfo.ToTitleCase($outputFileName)
        $outputFileName = $outputFileName + "($part).$outputExt"
      } else {
        $outputFileName = $outputFileName + $part + " "
      }
    }
    $outputFile = "$outputDir\$outputFileName"
    $mkvRipFile = Get-ChildItem $ripDir\$_ -Filter "*.mkv"
    $inputFile = "$mkvRipDir\$mkvRipFile"
    Start-Process "C:\Program Files\HandbrakeCLI\HandBrakeCLI.exe" -ArgumentList "--input `"$inputFIle`" --output `"$outputFIle`" --format `"av_mkv`" --encoder `"x264`" --encoder-preset `"Slower`" --encoder-profile `"High`" --encoder-level `"4.0`" --quality $ripQuality --rate 30.0 --pfr --audio-lang-list `"eng`" --all-audio --aencoder `"copy`" --audio-fallback `"dts`" --mixdown `"dpl2`" --subtitle-lang-list `"eng`" --all-subtitles --subtitle `"scan`" --subtitle-forced" -Wait -NoNewWindow
    Move-Item $mkvRipDir $doneDir
  }
}
