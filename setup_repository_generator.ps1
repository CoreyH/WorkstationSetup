
# PowerShell Script to Generate Setup Files and Folders
# Creates a structured repository with public and private setup instructions

# Define folder and file structure
$folders = @(
    "setup",
    "setup/private"
)

$files = @{
    "setup/README.md" = @"
# Machine Setup Instructions

Welcome to my machine setup repository! This is a guide for setting up a new machine with all the tools, configurations, and profiles I use. The instructions are split into the following sections:

- [Browser Setup](browser-setup.md): Setting up browser profiles and extensions.
- [Software Setup](software-setup.md): Installing essential software.
- [Development Environment](dev-environment.md): Configuring IDEs, programming languages, and tools.
- [Shortcuts and Scripts](shortcuts.md): Setting up custom shortcuts and automation.

Private details (like email addresses) are stored separately and are not included in this repository. Refer to your personal storage for those.

---

### Quick Start
1. Install Windows updates.
2. Run the initial setup script: `setup.ps1`.
3. Follow the guides in each section for more detailed steps.
"@

    "setup/browser-setup.md" = @"
# Browser Setup

## Edge Profiles
Set up the following profiles in Microsoft Edge:
1. **Work**: For work-related browsing.
2. **Personal**: For personal use.
3. **Testing**: For testing apps or sites.
4. **Dev**: For development and staging environments.
5. **Admin**: For admin dashboards and tools.

### Extensions
Install the following extensions for all profiles:
- [uBlock Origin](https://www.ublock.org/)
- [Grammarly](https://www.grammarly.com/)
- [LastPass](https://www.lastpass.com/)

---

**Private Details:** Email addresses for profiles are stored in `private/private-notes.md` or your 1Password vault.
"@

    "setup/software-setup.md" = @"
# Software Setup

## Essential Applications
Install the following software:
1. Google Chrome: `winget install --id Google.Chrome`
2. Visual Studio Code: `winget install --id Microsoft.VisualStudioCode`
3. Slack: `winget install --id SlackTechnologies.Slack`
4. Git: `winget install --id Git.Git`

## Additional Tools
- Docker Desktop: For containerized development.
- Postman: For API testing.
- Notion: For documentation and notes.

---

**Optional:** Customize your setup by adding additional tools based on your preferences.
"@

    "setup/dev-environment.md" = @"
# Development Environment

## Programming Languages
Install the following:
- **Node.js**: `winget install --id OpenJS.NodeJS`
- **Python**: `winget install --id Python.Python.3`

## IDE Configuration
### Visual Studio Code
1. Install the following extensions:
   - Python
   - Prettier
   - GitLens
2. Sync settings:
   - Enable settings sync in the Command Palette: `Ctrl+Shift+P` → "Turn on Settings Sync"

## Version Control
Set up Git:
\`\`\`bash
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
\`\`\`
"@

    "setup/shortcuts.md" = @"
# Shortcuts and Scripts

## Custom Shortcuts
- **Switch Windows Workspaces**: Alt + Shift + Arrow
- **Custom Browser Shortcut**: Ctrl + Shift + M

## Automation Scripts
Use the scripts in the `scripts/` folder for automating repetitive tasks.
"@

    "setup/private/private-notes.md" = @"
# Private Setup Details

## Browser Profiles
- **Work**: work@example.com
- **Personal**: personal@example.com
- **Testing**: testing@example.com
- **Dev**: dev@example.com
- **Admin**: admin@example.com

## API Keys
- Service A: \`xxxxxxxxxx\`
- Service B: \`yyyyyyyyyy\`

---

Store this file securely. Never commit it to a public repository.
"@

    "setup/private/.env" = @"
# Browser Profiles
EDGE_WORK_EMAIL=work@example.com
EDGE_PERSONAL_EMAIL=personal@example.com
EDGE_TESTING_EMAIL=testing@example.com
EDGE_DEV_EMAIL=dev@example.com
EDGE_ADMIN_EMAIL=admin@example.com
"@

    "setup/.gitignore" = @'
# Ignore private details
private/
.env
'@
}

# Create folders
foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Force -Path $folder
    }
}

# Create files with content
foreach ($file in $files.Keys) {
    $content = $files[$file]
    Set-Content -Path $file -Value $content -Force
}

Write-Host "Setup repository structure and files have been created successfully."
