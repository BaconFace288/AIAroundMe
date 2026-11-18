Add-Type -AssemblyName System.Drawing

$width = 1100
$height = 720
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit

# Background
$bgBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::White)
$g.FillRectangle($bgBrush, 0, 0, $width, $height)

# Fonts
$titleFont = [System.Drawing.Font]::new("Segoe UI", [single]16, [System.Drawing.FontStyle]::Bold)
$subtitleFont = [System.Drawing.Font]::new("Segoe UI", [single]10, [System.Drawing.FontStyle]::Italic)
$headerFont = [System.Drawing.Font]::new("Segoe UI", [single]10, [System.Drawing.FontStyle]::Bold)
$cellFont = [System.Drawing.Font]::new("Segoe UI", [single]9.5, [System.Drawing.FontStyle]::Regular)
$cellBoldFont = [System.Drawing.Font]::new("Segoe UI", [single]9.5, [System.Drawing.FontStyle]::Bold)
$badgeFont = [System.Drawing.Font]::new("Segoe UI", [single]8.5, [System.Drawing.FontStyle]::Bold)

# Brushes & Pens
$textBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(17, 24, 39))
$subtextBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(75, 85, 99))
$headerBgBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(243, 244, 246))
$altRowBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(249, 250, 251))
$borderPen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(209, 213, 219)), 1

# Badges
$aiBadgeBg = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(219, 234, 254))
$aiBadgeText = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(30, 64, 175))
$notAiBadgeBg = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(243, 244, 246))
$notAiBadgeText = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(75, 85, 99))
$notAiBadgeBorder = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(209, 213, 219)), 1

# Draw Header
$g.DrawString("Step 2: Find the AI on your phone (8 points)", $titleFont, $textBrush, 35, 25)
$g.DrawString("List 8 apps or features you actually use. Include at least two you think are not AI.", $subtitleFont, $subtextBrush, 35, 58)

# Table layout
$startX = 35
$startY = 90
$colWidths = @(35, 240, 100, 650)
$totalTableWidth = 35 + 240 + 100 + 650 # 1025

# Draw Table Header
$headerHeight = 35
$g.FillRectangle($headerBgBrush, $startX, $startY, $totalTableWidth, $headerHeight)
$g.DrawRectangle($borderPen, $startX, $startY, $totalTableWidth, $headerHeight)

$colNames = @("#", "App or feature", "AI or Not AI?", "If AI: what did it learn from? If not AI: what rule does it follow?")
$currX = $startX
for ($c = 0; $c -lt 4; $c++) {
    $rect = New-Object System.Drawing.RectangleF $currX, ($startY + 8), $colWidths[$c], $headerHeight
    $format = New-Object System.Drawing.StringFormat
    if ($c -eq 0) { $format.Alignment = [System.Drawing.StringAlignment]::Center }
    else { $currX_pad = $currX + 8; $rect.X = $currX_pad; $rect.Width -= 16 }
    $g.DrawString($colNames[$c], $headerFont, $textBrush, $rect, $format)
    $currX += $colWidths[$c]
    $g.DrawLine($borderPen, $currX, $startY, $currX, ($startY + $headerHeight))
}

# Table Rows
$rows = @(
    @("1", "TikTok / YouTube Feed", "AI", "It learned from what millions of people watch, skip, like, and replay, along with my personal watch history and dwell time."),
    @("2", "Camera Portrait Mode", "AI", "It learned from millions of labeled photos of people and backgrounds to predict where edges are to blur the background."),
    @("3", "Predictive Text / Autocorrect", "AI", "It learned from huge datasets of typed text, sentences, common typo patterns, and my frequent phrases to predict the next word."),
    @("4", "Spotify Discover Weekly", "AI", "It learned from millions of playlists, listening sequences, skips, and user saves, combined with my own listening habits."),
    @("5", "Voice Assistant (Siri)", "AI", "It learned from thousands of hours of speech recordings from diverse voices and accents to transcribe audio into text commands."),
    @("6", "Email Spam Filter (Gmail)", "AI", "It learned from millions of emails that users previously marked as spam or not spam to detect patterns in unwanted messages."),
    @("7", "Phone Alarm / Clock App", "Not AI", "It follows a human-written rule: compare current device time to the alarm time; if they match, play the alarm audio."),
    @("8", "Notes App / Checklist", "Not AI", "It follows human-written rules: when a key is pressed, append the character to storage; when a checkbox is tapped, toggle its state.")
)

$currY = $startY + $headerHeight
$rowHeight = 65

for ($r = 0; $r -lt $rows.Length; $r++) {
    if ($r % 2 -eq 1) {
        $g.FillRectangle($altRowBrush, $startX, $currY, $totalTableWidth, $rowHeight)
    }
    $g.DrawRectangle($borderPen, $startX, $currY, $totalTableWidth, $rowHeight)
    
    $currX = $startX
    for ($c = 0; $c -lt 4; $c++) {
        $cellVal = $rows[$r][$c]
        if ($c -eq 0) {
            $numRect = New-Object System.Drawing.RectangleF $currX, ($currY + 22), $colWidths[$c], 30
            $numFormat = New-Object System.Drawing.StringFormat
            $numFormat.Alignment = [System.Drawing.StringAlignment]::Center
            $g.DrawString($cellVal, $cellBoldFont, $subtextBrush, $numRect, $numFormat)
        } elseif ($c -eq 1) {
            $nameRect = New-Object System.Drawing.RectangleF ($currX + 10), ($currY + 22), ($colWidths[$c] - 20), 40
            $g.DrawString($cellVal, $cellBoldFont, $textBrush, $nameRect)
        } elseif ($c -eq 2) {
            # Badge
            $badgeX = $currX + 15
            $badgeY = $currY + 18
            $badgeW = if ($cellVal -eq "AI") { 42 } else { 62 }
            $badgeH = 26
            
            if ($cellVal -eq "AI") {
                $g.FillRectangle($aiBadgeBg, $badgeX, $badgeY, $badgeW, $badgeH)
                $bRect = New-Object System.Drawing.RectangleF $badgeX, ($badgeY + 5), $badgeW, $badgeH
                $bFormat = New-Object System.Drawing.StringFormat
                $bFormat.Alignment = [System.Drawing.StringAlignment]::Center
                $g.DrawString("AI", $badgeFont, $aiBadgeText, $bRect, $bFormat)
            } else {
                $g.FillRectangle($notAiBadgeBg, $badgeX, $badgeY, $badgeW, $badgeH)
                $g.DrawRectangle($notAiBadgeBorder, $badgeX, $badgeY, $badgeW, $badgeH)
                $bRect = New-Object System.Drawing.RectangleF $badgeX, ($badgeY + 5), $badgeW, $badgeH
                $bFormat = New-Object System.Drawing.StringFormat
                $bFormat.Alignment = [System.Drawing.StringAlignment]::Center
                $g.DrawString("Not AI", $badgeFont, $notAiBadgeText, $bRect, $bFormat)
            }
        } elseif ($c -eq 3) {
            $descRect = New-Object System.Drawing.RectangleF ($currX + 10), ($currY + 12), ($colWidths[$c] - 20), ($rowHeight - 16)
            $g.DrawString($cellVal, $cellFont, $textBrush, $descRect)
        }
        
        $currX += $colWidths[$c]
        $g.DrawLine($borderPen, $currX, $currY, $currX, ($currY + $rowHeight))
    }
    
    $currY += $rowHeight
}

$outputPath = Join-Path $PSScriptRoot "step2_table_screenshot.png"
$bmp.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

$g.Dispose()
$bmp.Dispose()
Write-Output "Screenshot saved successfully to $outputPath"
