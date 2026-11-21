# Serves this folder at http://localhost:8000 for previewing. Ctrl+C stops it.
param([int]$Port = 8000)

$root = $PSScriptRoot
$types = @{
  '.html' = 'text/html; charset=utf-8'; '.css' = 'text/css'; '.svg' = 'image/svg+xml'
  '.png' = 'image/png'; '.txt' = 'text/plain; charset=utf-8'
}
$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add("http://localhost:$Port/")
$listener.Start()
Write-Host "Serving $root at http://localhost:$Port/"
try {
  while ($listener.IsListening) {
    $ctx = $listener.GetContext()
    $path = [Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath).TrimStart('/')
    $file = Join-Path $root $path
    if (Test-Path $file -PathType Container) { $file = Join-Path $file 'index.html' }
    $status = 200
    if (-not (Test-Path $file -PathType Leaf)) { $file = Join-Path $root '404.html'; $status = 404 }
    $bytes = [IO.File]::ReadAllBytes($file)
    $ext = [IO.Path]::GetExtension($file)
    $ctx.Response.StatusCode = $status
    $ctx.Response.ContentType = if ($types[$ext]) { $types[$ext] } else { 'application/octet-stream' }
    $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    $ctx.Response.Close()
  }
} finally { $listener.Stop() }
