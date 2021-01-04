
$conf = @(
    @{ name='war-of-the-eight'; source = 'war-of-the-eight/war-of-the-eight.md'; league = 0; language='en' },
    @{name='layout';source = 'layout.md'; league = 3; language='en' },
    @{name='fencing-esport';source = 'fencing-esport_en.md'; league = 3; language='en' }
    @{name='fencing-esport';source = 'fencing-esport_fr.md'; league = 3; language='fr'}
    @{name='save-pingouins';source = 'save-pingouins.md'; league = 0; language='en' }
)

$conf | % {
    $source = "$PSScriptRoot/samples/$($_.source)";
    $basename = $_.name;
    $dest = "$PSScriptRoot/docs/$basename";
    Write-Host "export $source ->  to $dest .."
    . "$PSScriptRoot/markdown2cg.ps1" -Source $source -ReviewDestination $dest -Leagues $_.league -Language $_.language;
}