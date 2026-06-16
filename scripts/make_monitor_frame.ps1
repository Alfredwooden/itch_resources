Add-Type -AssemblyName System.Drawing

$src = Join-Path $PSScriptRoot '..\Assets\Monitor_Clean.png'
$dst = Join-Path $PSScriptRoot '..\Assets\Monitor_Frame.png'

$bmp = [System.Drawing.Bitmap]::FromFile((Resolve-Path $src))
$new = New-Object System.Drawing.Bitmap $bmp.Width, $bmp.Height, ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb)

for ($y = 0; $y -lt $bmp.Height; $y++) {
    for ($x = 0; $x -lt $bmp.Width; $x++) {
        $c = $bmp.GetPixel($x, $y)
        if ($c.R -lt 35 -and $c.G -lt 35 -and $c.B -lt 35) {
            $alpha = 0
        } else {
            $alpha = $c.A
        }
        $new.SetPixel($x, $y, [System.Drawing.Color]::FromArgb($alpha, $c.R, $c.G, $c.B))
    }
}

$new.Save($dst, [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$new.Dispose()

Write-Output "Saved $dst"
