
$conf = @(
    @{ name='war-of-the-eight'; source = 'war-of-the-eight/war-of-the-eight.md'; league = 0; language='en' }
    @{name='layout';source = 'layout.md'; league = 3; language='en' }
    @{name='fencing-esport';source = 'fencing-esport_en.md'; league = 3; language='en' }
    @{name='fencing-esport';source = 'fencing-esport_fr.md'; league = 3; language='fr'}
    @{name='save-pingouins';source = 'save-pingouins.md'; league = 0; language='en' }
)

$conf | % {
    $source = "$PSScriptRoot/samples/$($_.source)";
    $basename = $_.name;

    
    $ReviewDestination = "$PSScriptRoot/docs/$basename";
    $ReleaseDestination = "$PSScriptRoot/dist/$basename";
    . "$PSScriptRoot/markdown2cg.ps1" -Source $source -ReviewDestination $ReviewDestination -ReleaseDestination $ReleaseDestination -Leagues $_.league -Language $_.language;
}