call sfdx force:org:list
set /p orgName="Enter Scratch Org Name: "
echo Creating Scratch Org:
call sfdx force:org:create -s -f config/project-scratch-def.json -d 30 -a %orgName%

echo Push the codebase into the scratch org:
call sfdx force:source:push -u %orgName%

echo Assign yourself the System Admin permission set in the scratch org:
call sfdx force:user:permset:assign -n SystemAdmin

echo Assign yourself the System Admin permission set Group in the scratch org:
call sfdx force:user:permset:assign -n AdminGroups

echo Create sample data for you in scratch org:
:: Date format YYYY-MM-DD
call sfdx force:data:tree:import -p ./data/data-plan.json

echo Open Scratch Org:
call sfdx force:org:open -u %orgName%
pause