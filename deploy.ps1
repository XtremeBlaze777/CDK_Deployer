python cdk.json-fix.py
cdk bootstrap

$STACKNUM = Read-Host "How many stacks will you be deploying? (enter 0 if none)"
$STACKLIST = @()

for ($i = 1; $i -le $STACKNUM; $i++) {
	$TMP = Read-Host "Name of Stack $i"
	$STACKLIST += @( $TMP )
}

foreach ($STACK in $STACKLIST) {
	Start-Sleep -Seconds 1
	$PARAMS = Read-Host "How many parameters does $STACK take? (Enter 0 if none)"
	
	$COMMAND = "cdk deploy $STACK"
	if ( $PARAMS -gt 0 ) {
		for ($PARAM = 1; $PARAM -le $PARAMS; $PARAM++) {
			$NAME = Read-Host "Enter parameter $PARAM's name (not the value) listed in your CDK code"
			$VALUE = Read-Host "Enter $NAME's value"

			$COMMAND+=" --parameters $NAME=$VALUE"
		}
	}
	Write-Output "Deploying $STACK"
	Start-Sleep -Seconds 2
	Invoke-Expression $COMMAND
}
