function CreatePackage ($uiPathPath, $projectPath, $projectName, $version, $outputPath) {
	If ([System.IO.File]::Exists($outputPath + "\" + $projectName + "." + $version + ".nupkg")) {
		[System.IO.File]::Delete($outputPath + "\" + $projectName + "." + $version + ".nupkg")
	}
	
	
	& $uiPathPath -pack $projectPath -o $outputPath -v $version
	
	
	#$command = $uiPathPath + " -pack """ + $projectPath + """ -o """ + $outputPath +"""-v " + $version
	
	#Invoke-Expression $command
	
	##return $outputPath + "\" + $projectName + "." + $version + ".nupkg"
}

function GetVersion ($jsonLocation) {
	If ([System.IO.File]::Exists($jsonLocation)) {
	
		#Read contents of the json file
		$fileContent = Get-Content -Path $jsonLocation
		
		#Get Current Version
		$currentVersion = $fileContent | Where-Object {$_ -like '*projectVersion*'}
		$subVersionNumber = [Int32]::Parse($currentVersion.Split(":")[1].Split(".")[2].Replace("""","").Replace(",",""))
		
		$currentYear = Get-Date -Format "yyyy"
		$currentMonth = Get-Date -Format "MM"
		IF ($currentMonth[0] -eq "0"){
			$currentMonth = $currentMonth[1]
		}
		
		$previousYear = $currentVersion.Split(":")[1].Split(".")[0].Replace("""","").Trim(" ")
		$previousMonth = $currentVersion.Split(":")[1].Split(".")[1].Replace("""","").Trim(" ")
			
		If (($currentYear -ne $previousYear) -or ($currentMonth -ne $previousMonth))
		{
			$subVersionNumber = 0
		}
		else
		{
			$subVersionNumber = $subVersionNumber + 1
		}
		return $currentYear + "." + $currentMonth + "." + $subVersionNumber
	}
	
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

function GetUiPathPath ($path) {
	$version = $(Get-ChildItem -Path $path -Filter "app*" -Directory -Force -ErrorAction SilentlyContinue | select -last 1)		
	Write-Host "Se va a usar el empaquetador de" $version
	return $version
}

Write-Host "### Start ###"

#$uiPathPath = $Env:homepath + "\AppData\Local\UiPath\" + $(GetUiPathPath($Env:homepath + "\AppData\Local\UiPath\")) + "\UiRobot.exe"
$uiPathPath = $Env:homepath + "\AppData\Local\Programs\UiPath\Studio\UiRobot.exe"
$projectPath = [System.Environment]::CurrentDirectory + "\RobotBase\project.json"
$outputPath = [System.Environment]::CurrentDirectory
$jsonLocation = "lib/net45/project.json"
$schemaFrom = """schemaVersion"": ""4.0"","
$schemaTo = """schemaVersion"": ""3.2"","

Write-Host "### Get project name ###"
$projectName = '' + $(GetProjectName $projectPath)

Write-Host "### Get version ###"
$version = '' + $(GetVersion $projectPath)


Write-Host "### Creating package in " + $OutputPath + " ###"
CreatePackage $uiPathPath $projectPath $projectName $version $outputPath

#Para la version deberia de usar yyyy.mm.incremental
#si cambia el mes -> incremental = 0

Write-Host "### End ###"

#pause

#pedir el número de versión por parámetro

