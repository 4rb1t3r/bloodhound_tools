Write-Host " "
Write-Host "--------------------------------------**NOTE**--------------------------------------"
Write-Host "This script currently requires the input json file to be in the listed directory."
Write-Host "Please ensure the input file is in the directory listed."
Write-Host "------------------------------------------------------------------------------------"
Write-Host "Current Working Directory": $pwd
Write-Host " "
#Could make this variable down the road
#$changedir =  Read-Host "Change file input directory? y/n"
$file = Read-Host "Enter input file name"  
$appendtxt = ".json"
$file = $file+$appendtxt
$fullpath = join-path -path $pwd -ChildPath $file
#Could make this variable down the road
#$changeoutputdir = Read-Host "Change file output directory? y/n"
$outputfilename = Read-Host "Enter output filename "
$outputfullpath = join-path -path $pwd -ChildPath $outputfilename

$json = [ordered]@{}


(Get-Content $fullpath -Raw | ConvertFrom-Json).PSObject.Properties |
    ForEach-Object { 
    $json[$_.Name] = $_.Value 
    }

#looks at all nodes, finds nodes where the field named "type" equals Computer, then displays the field named label for that node.
Write-Host "Available field names include id, label,and type."
Write-Host "See JSON file for all fields."
$field = Read-Host "Type field name to display"
$filter = Read-Host "Type filter to use: Computer/User"
$results = ($json.nodes.Where({$_.type -eq $filter }).$field) 

#takes results, outputs them to a csv file
$results | Out-File $outputfilename".csv"
Write-Host " "
Write-Host "Success"
Write-Host "Results exported to" $pwd"\"$outputfilename".csv"


