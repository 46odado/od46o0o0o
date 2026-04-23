[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$c = Get-Content index.html -Raw -Encoding UTF8
$m = [regex]::Match($c, '(?s)<script id="embeddedData" type="application/json">\s*(\{.*?\})\s*</script>')
$data = ConvertFrom-Json $m.Groups[1].Value
$all = $data.words
Write-Host ('Total words: ' + $all.Count)
$all | Group-Object pos | ForEach-Object { Write-Host ($_.Name + ': ' + $_.Count) }
Write-Host ('Roots: ' + ($data.roots.PSObject.Properties | Measure-Object).Count)
Write-Host ('Prefixes: ' + ($data.prefixes.PSObject.Properties | Measure-Object).Count)
