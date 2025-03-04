# Define paths
$sourceFolder = "./ITR2-Unbound"
$readmeFile = "./Readme.md"
$readmeTxtFile = "./Readme.txt"
$zipFile = "./ITR2-Unbound.zip"

# Convert Readme.md to Readme.txt
Get-Content $readmeFile | Set-Content $readmeTxtFile

# Create a zip file
if (Test-Path $zipFile) {
    Remove-Item $zipFile
}
Compress-Archive -Path $sourceFolder -DestinationPath $zipFile

# Add Readme.txt to the zip file
Compress-Archive -Path $readmeTxtFile -Update -DestinationPath $zipFile

# Clean up
Remove-Item $readmeTxtFile
