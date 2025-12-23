\# Disk Usage Monitor



Bash script that monitors disk usage and reports warnings and critical alerts.





\## Features

\- Checks disk usage for root filesystem

\- WARNING alert printed to stdout (80%)

\- CRITICAL alert printed to stderr (90%)

\- Dry-run mode for safe testing

\- Cron/systemd friendly





\## Usage

&nbsp;- Make executable:

&nbsp; chmod +x disk\_usage\_monitor.sh



&nbsp;- Run normally:

&nbsp; ./disk\_usage\_monitor.sh



&nbsp;- Dry-run mode:

&nbsp;  DRY\_RUN=true ./disk\_usage\_monitor.sh

