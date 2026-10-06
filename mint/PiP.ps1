# Requires PowerShell 5+

Add-Type @"
using System;
using System.Runtime.InteropServices;

public class Win32 {
    public delegate bool EnumWindowsProc(IntPtr hWnd, IntPtr lParam);

    [DllImport("user32.dll")]
    public static extern bool EnumWindows(EnumWindowsProc lpEnumFunc, IntPtr lParam);

    [DllImport("user32.dll")]
    public static extern bool IsWindowVisible(IntPtr hWnd);

    [DllImport("user32.dll", CharSet = CharSet.Unicode)]
    public static extern int GetWindowText(IntPtr hWnd, System.Text.StringBuilder text, int count);

    [DllImport("user32.dll")]
    public static extern bool MoveWindow(
        IntPtr hWnd,
        int X,
        int Y,
        int nWidth,
        int nHeight,
        bool bRepaint
    );
}
"@

# Screen dimensions
Add-Type -AssemblyName System.Windows.Forms

$screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds

$SW = $screen.Width
$SH = $screen.Height

$W = [int]($SW / 2)
$H = [int]($SH / 2)
$X = [int]($SW / 2)
$Y = 0

# Enumerate windows
$windows = @()

$callback = {
    param($hWnd, $lParam)

    if ([Win32]::IsWindowVisible($hWnd)) {
        $title = New-Object System.Text.StringBuilder 512
        [Win32]::GetWindowText($hWnd, $title, $title.Capacity) | Out-Null

        $text = $title.ToString().Trim()

        if ($text.Length -gt 0) {
            $script:windows += [PSCustomObject]@{
                Handle = $hWnd
                Title  = $text
            }
        }
    }

    return $true
}

$delegate = [Win32+EnumWindowsProc]$callback
[Win32]::EnumWindows($delegate, [IntPtr]::Zero) | Out-Null

# Auto-detect Picture-in-Picture
$target = $windows | Where-Object {
    $_.Title -match "Picture-in-Picture"
} | Select-Object -First 1

if ($target) {
    Write-Host "Auto-selected PiP window: $($target.Title)"
    [Win32]::MoveWindow($target.Handle, $X, $Y, $W, $H, $true)
    exit
}

# Manual selection
Write-Host "Select a window:"

for ($i = 0; $i -lt $windows.Count; $i++) {
    Write-Host "$($i + 1)) $($windows[$i].Title)"
}

$choice = Read-Host "Enter number"

if (($choice -notmatch '^\d+$') -or
    ([int]$choice -lt 1) -or
    ([int]$choice -gt $windows.Count)) {

    Write-Host "Invalid selection. Congratulations."
    exit 1
}

$target = $windows[[int]$choice - 1]

[Win32]::MoveWindow($target.Handle, $X, $Y, $W, $H, $true)
