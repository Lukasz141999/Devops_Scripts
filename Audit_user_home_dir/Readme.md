\# AD Home Folder Audit Script



PowerShell script that audits user home directories stored on a network share and correlates them with Active Directory user accounts.





The script generates a CSV report containing:

\- folder owner (SamAccountName)

\- user display name

\- home folder size

\- account status (Active / Disabled / NotFound)





\## Features

\- Scans network share for user home directories

\- Calculates folder size recursively

\- Queries Active Directory for user account status

\- Detects disabled and missing AD accounts

\- Exports results to CSV for further analysis

\- Handles errors gracefully using try/catch blocks





\## Requirements

\- Windows environment

\- PowerShell 5.1 or newer

\- Active Directory PowerShell module (RSAT)

\- Read access to the network share

\- Permission to query Active Directory





\## Configuration

&nbsp;- Edit the following variables in the script:

&nbsp; $folderPath = "\\\\full\\folder\\path"

&nbsp; $outputFile = "output\\file\\path.csv"



\## Usage

run audit\_user\_home\_dir.ps1

