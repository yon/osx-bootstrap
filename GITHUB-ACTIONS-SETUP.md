# GitHub Actions License Injection Setup

This repository uses GitHub Actions to generate personalized bootstrap scripts with sensitive license information (like iStat Menus license) securely injected.

## 🔧 Setup Instructions

### 1. Configure Repository Secrets

Add the following secrets to your GitHub repository:

1. Go to your repository on GitHub
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret** and add:

   - **Name:** `ISTAT_MENUS_LICENSE_EMAIL`
   - **Value:** Your iStat Menus license email

   - **Name:** `ISTAT_MENUS_LICENSE_SERIAL`
   - **Value:** Your iStat Menus license serial number

### 2. Generate Personalized Bootstrap

#### Manual Trigger (Recommended)
1. Go to **Actions** tab in your repository
2. Select **Generate Personalized Bootstrap** workflow
3. Click **Run workflow**
4. Optionally provide a custom branch suffix
5. Wait for the workflow to complete
6. Check the **Summary** tab for your personalized URLs

#### Automatic Trigger
The workflow runs automatically every Sunday at midnight UTC to refresh the personalized branch.

## 📋 Usage

### For Personal Use (With License)
Use the personalized branch URL provided in the GitHub Actions summary:

```bash
# Complete bootstrap with license
curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/personalized-20240124-1200/osx-bootstrap.sh | bash

# Just preferences with license
curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/personalized-20240124-1200/Makefile | make -f - osx-preferences
```

### For Public Sharing (No License)
Share the main branch (license information removed):

```bash
# Complete bootstrap without license
curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/osx-bootstrap.sh | bash
```

## 🔒 Security Features

- **License never committed:** Sensitive information stays in GitHub Secrets
- **Temporary branches:** Personalized branches auto-expire after 7 days
- **Automatic cleanup:** Old personalized branches are automatically removed
- **Private URLs:** Personalized URLs should be kept private

## 🛠️ Manual Tools

### License Injection
```bash
# Inject license into sanitized settings
python3 scripts/istat-menus-inject-license.py \
  --input preferences/istat-menus-settings.ismp \
  --output /tmp/licensed-settings.ismp \
  --email "your@email.com" \
  --serial "YOUR-LICENSE-SERIAL"
```


## 📁 File Structure

```
.github/workflows/
  generate-personalized-bootstrap.yml  # Main workflow
scripts/
  istat-menus-inject-license.py       # License injection tool
preferences/
  istat-menus-settings.ismp           # Sanitized settings (safe to commit)
  istat-menus-settings-original.ismp  # Original with license (gitignored)
```

## 🔄 Branch Lifecycle

1. **Manual/Scheduled Trigger:** GitHub Action starts
2. **License Injection:** Secrets are injected into sanitized settings
3. **Branch Creation:** New `personalized-YYYYMMDD-HHMM` branch created
4. **Auto-Cleanup:** Branches older than 7 days are automatically deleted
5. **Usage:** Use the generated URLs for personalized bootstrap

## ⚠️ Important Notes

- Keep personalized branch URLs private (they contain your license)
- Personalized branches expire after 7 days for security
- Main branch is always safe for public sharing
- Re-run the workflow to generate fresh personalized URLs
- License can be added manually in iStat Menus if using the main branch
