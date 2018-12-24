# Easily jump around the file system by manually adding marks
# marks are stored as symbolic links in the directory $MARKPATH (default $HOME/.marks)
#
# jump FOO: jump to a mark named FOO
# mark FOO: create a mark named FOO
# unmark FOO: delete a mark
# marks: lists all marks

$CONFIG_DIR = "~\.poshjump"
$CONFIG_FILE = "~\.poshjump\marks.json"

Function jump_config {
  if (!(Test-Path $CONFIG_DIR)) {
    New-Item -Path $CONFIG_DIR -ItemType Directory | Out-Null
  }

  if (!(Test-Path $CONFIG_FILE)) {
    New-Item -Path $CONFIG_FILE | Out-Null
    $defaultData = ConvertFrom-Json '{ "default" : "~" }'
    $defaultData | ConvertTo-Json | Set-Content $CONFIG_FILE 
    return
  }
}

Function jump {
  Param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$label
  )

  jump_config

  $marksData = Get-Content $CONFIG_FILE | Out-String | ConvertFrom-Json

  if (!$marksData.$label) {
    return "Error: no mark found labeled as $label"
  }

  Set-Location $marksData.$label
}

Function mark {
  Param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$label
  )

  jump_config

  $confirm = Read-Host "Mark $PWD as $($label)? (y/n)"

  if ($confirm -eq 'y') {


    $marksData = Get-Content $CONFIG_FILE | Out-String | ConvertFrom-Json
      
    if ($marksData.$label) {
      return "Error: mark already exists as $label"
    }

    $marksData | Add-Member -Type NoteProperty -Name $label -Value $PWD.Path
    $marksData | ConvertTo-Json | Set-Content $CONFIG_FILE
    Write-Output "Successfully marked"
    
  }
  
}

Function unmark {
  Param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$label
  )

  jump_config

  $marksData = Get-Content $CONFIG_FILE | Out-String | ConvertFrom-Json

  if (!$marksData.$label) {
    return "Error: no mark found labeled as $label"
  }

  $confirm = Read-Host "Are you sure to unmark $($label)? (y/n)"

  if ($confirm -eq 'y') {
  
    $marksData.PSObject.Properties.Remove($label)
    $marksData | ConvertTo-Json | Set-Content $CONFIG_FILE

    Write-Output 'Successfully removed'
  }
}

Function marks {
  jump_config

  $marksData = Get-Content $CONFIG_FILE | Out-String | ConvertFrom-Json

  $marksData | Format-List

}

Export-ModuleMember -Function *