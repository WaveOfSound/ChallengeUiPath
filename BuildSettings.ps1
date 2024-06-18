param (
    [string]$environment,
    [string]$baseProjectFolder,
    [string]$destinationConfigFolder
)

function DeleteFolder($destinationConfigFolder){
    write-host "    #### INFO - Destination config path:"
    write-host "                $destinationConfigFolder" -ForegroundColor Green
    if ([System.IO.Directory]::Exists($destinationConfigFolder)) {
        [System.IO.Directory]::Delete($destinationConfigFolder, $true)
    }
}

function CompareAndCreateJson ($baseConfigFiles, $envConfigFolder, $destinationConfigFolder) {
### Loop Config Files - Start
    [System.IO.Directory]::CreateDirectory($destinationConfigFolder) | Out-Null
    write-host "    #### INFO - Generating files:"
    for($i=0; $i -lt $baseConfigFiles.Length; $i++) {
    
        $fileInfo = ([System.IO.FileInfo]$baseConfigFiles[$i])
    
        write-host "                $($fileInfo.Name)" -ForegroundColor Green

        $envConfigFilePath = [System.IO.Path]::Combine($envConfigFolder, $fileInfo.Name)
        $destinationConifgFilePath = [System.IO.Path]::Combine($destinationConfigFolder, $fileInfo.Name)
    
        $baseConfigJson = [System.IO.File]::ReadAllText($baseConfigFiles[$i]) | ConvertFrom-Json
		
		
        if ([System.IO.File]::Exists($envConfigFilePath))
        {
            $envConfigJson = [System.IO.File]::ReadAllText($envConfigFilePath) | ConvertFrom-Json

            for($j=0; $j -lt $baseConfigJson.Length; $j++) {
                if ($baseConfigJson[$j].Key -NE "comment"){
                    $envConfigJson | Foreach-Object { IF($_.Key -and $_.Key -EQ $baseConfigJson[$j].Key) { $baseConfigJson[$j].Value = $_.Value } }
                }
                
            }
        }
        
        $destinationConfigJson =  $baseConfigJson | ConvertTo-Json
        [IO.File]::WriteAllText($destinationConifgFilePath, $destinationConfigJson)
    }
	### Loop Config Files - End
	
}

function GetProjectName ($jsonLocation) {
	If ([System.IO.File]::Exists($jsonLocation)) {
	
		#Read contents of the json file
		$fileContent = Get-Content -Path $jsonLocation
		
		#Get Current Version
		$nameLine = $fileContent | Where-Object {$_ -like '*"name"*'}
		$name = $nameLine.Split(":")[1].Replace("""","").Replace(",","").Trim()
		return $name
	}
	
}

Try {
	
	Write-Host "### Get project name ###"
	$projectPath = [System.Environment]::CurrentDirectory + "\RobotBase\project.json"
	$projectName = '' + $(GetProjectName $projectPath)

    write-host ""
    write-host "#### INFO - Generating configuration files" -ForegroundColor Cyan
    write-host ""

    while ($environment -eq $null -or @("dev","stage","main") -notcontains $environment) {
        $environment = read-host -Prompt "    Please enter environment name (dev, stage, main)"
        write-host ""
    }

    $environment = "_" + $environment
    write-host "    #### INFO - Environment: $environment"

 
    $baseConfigFolder = [System.IO.Path]::Combine([System.Environment]::CurrentDirectory,"RobotBase","Data",$projectName)
    if ([System.String]::IsNullOrEmpty($destinationConfigFolder)) {
        $destinationConfigFolder = [System.IO.Path]::Combine([System.Environment]::CurrentDirectory,"Settings")
    }
    $envConfigFolder = [System.IO.Path]::Combine($baseConfigFolder, $environment)

	write-host "    #### INFO - Delete destination folder if exists"
    DeleteFolder $destinationConfigFolder
	write-host "    #### INFO - Create new destination folder"
	[System.IO.Directory]::CreateDirectory($destinationConfigFolder) | Out-Null

    write-host "    #### INFO - Base config path:"
    write-host "                $baseConfigFolder" -ForegroundColor Green
    write-host "    #### INFO - Enviroment specific config path:"
    write-host "                $envConfigFolder" -ForegroundColor Green

    if ([System.IO.Directory]::Exists($envConfigFolder) -eq $false) {
        write-host "    #### ERROR - The subdirectory for the Environment $environment does not exist" -ForegroundColor Red
        write-host "                 $envConfigFolder" -ForegroundColor Red
        Throw ""
    }

        

	write-host "    #### INFO - Get Files -Settings folder"
	write-host 
    $baseConfigFiles = [System.IO.Directory]::GetFiles($baseConfigFolder+'/_base/Settings', "*.json");

    $tempDestinationConfigFolder = [System.IO.Path]::Combine($destinationConfigFolder,"Settings")
    $tempEnvConfigFolder = [System.IO.Path]::Combine($envConfigFolder,"Settings")
    CompareAndCreateJson $baseConfigFiles $tempEnvConfigFolder $tempDestinationConfigFolder

    
	write-host "    #### INFO - Get Files -Language folder"
    $baseConfigFiles = [System.IO.Directory]::GetFiles($baseConfigFolder+'/_base/Language', "*.json");

    $tempEnvConfigFolder = $null
    $tempDestinationConfigFolder = $null
    $tempDestinationConfigFolder = [System.IO.Path]::Combine($destinationConfigFolder,"Language")
    $tempEnvConfigFolder = [System.IO.Path]::Combine($envConfigFolder,"Language")
    CompareAndCreateJson $baseConfigFiles $tempEnvConfigFolder $tempDestinationConfigFolder
	
    write-host ""
    write-host "#### INFO - Finished generating configuration files" -ForegroundColor Cyan
    write-host ""

} Catch {
    throw
}


