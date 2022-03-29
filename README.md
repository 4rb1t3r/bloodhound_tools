# bloodhound_tools

### Takes results from Bloodhound exports (JSON) and converts the results into a CSV for reporting. 

### Tested with Bloodhound 9.4.0.

### General
This PowerShell script can take the results of a Bloodhound export and convert the results into a CSV file. This can be helpful for Blue Team/Purple Teams to display Bloodhound data to IAM/ access management groups without needing to provide them access to Bloodhound. You can chose the field you are looking for so long as it is a field in the export. Some sample field names include id, label, and type.

### Sample Use Case:

1. A Bloodhound query is performed to find all users with administrator rights.
2. The bloodhound query results are exported from Bloodhound (JSON)
3. The export is copy/pasted into the directory the Bloodhound_json_to_csv.ps1 is located.
4. The export is opened to view the available JSON fields. BH 9.4.0 has fields such as id, label and type.
5. The Bloodhound_json_to_csv.ps1 script is run. A field to output is chosen. 




