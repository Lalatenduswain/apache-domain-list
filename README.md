# Apache Domain to Directory Mapping Script 🖥️🌐

A simple yet powerful Bash utility to **audit Apache virtual hosts** by extracting configured **domains (ServerName / ServerAlias)** and their corresponding **DocumentRoot directories** from enabled Apache site configurations.

This script is especially useful for **system administrators, DevOps engineers, and cloud administrators** who manage multiple Apache virtual hosts and need a quick overview for troubleshooting, migration, or documentation.

---

## 📌 Features

- 🔍 Scans all **enabled Apache virtual hosts**
- 🌐 Extracts:
  - `ServerName`
  - `ServerAlias`
  - `DocumentRoot`
- 📋 Displays a clean, readable table output
- 🧠 Helps during:
  - Apache → Nginx migration
  - SSL audits
  - Staging vs production verification
  - Infrastructure documentation
- ⚡ Lightweight, fast, and dependency-free
- 🛡️ Read-only operation (safe to run)

---

## 📖 Script Overview

**Script Name:** `apache-domain-list.sh`  
**Purpose:**  
To list Apache virtual host domain-to-directory mappings from enabled site configuration files.

The script parses each enabled `.conf` file and prints:
- Primary domain (`ServerName`)
- Alias domains (`ServerAlias`)
- Corresponding web root (`DocumentRoot`)

---

## 🧩 Prerequisites

Before running the script, ensure the following:

### ✅ System Requirements
- Linux-based system
- Apache HTTP Server installed

### ✅ Required Packages
These are usually preinstalled on most Linux systems:
- `bash`
- `coreutils`
- `grep`
- `awk`

### ✅ Permissions
- Read access to Apache configuration directory
- `sudo` privileges may be required depending on system permissions

---

## 📂 Apache Directory Assumptions

The script assumes Apache enabled site configurations are located at:

```

/etc/apache2/sites-enabled/

````

> If your Apache installation uses a different path, update the variable inside the script accordingly.

---

## 📥 Installation Guide

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/Lalatenduswain/apache-domain-list
````

```bash
cd apache-domain-list.sh
```

---

### 2️⃣ Make the Script Executable

```bash
chmod +x apache-domain-list.sh
```

---

### 3️⃣ Run the Script

```bash
sudo ./apache-domain-list.sh
```

> `sudo` is recommended to avoid permission issues while reading Apache config files.

---

## 📊 Sample Output

```
======================================================================
          Apache Virtual Host Domain-to-Directory Mappings
======================================================================
DOMAIN                                        | DIRECTORY
----------------------------------------------------------------------
example.domain.com                            | /var/www/example/public
  (alias: www.example.domain.com)             |
test.domain.com                               | /var/www/test/public
----------------------------------------------------------------------
Total config files scanned: 10
======================================================================
```

> Note: Domain names and paths shown here are **dummy examples** for documentation purposes.

---

## 🧠 How the Script Works (Explanation)

1. Defines Apache enabled sites directory:

   * `/etc/apache2/sites-enabled`

2. Iterates through all `.conf` files in that directory

3. Reads each file line-by-line to extract:

   * `ServerName`
   * `ServerAlias`
   * `DocumentRoot`

4. Prints:

   * Primary domain with its document root
   * Alias domains (if available)

5. Displays a final count of scanned configuration files

The script **does not modify** any configuration files.

---

## 🛠️ Customization Tips

* Change Apache config directory:

  ```bash
  SITES_ENABLED="/custom/apache/sites-enabled"
  ```

* Extend output for:

  * CSV export
  * JSON output
  * Logging to file
  * Automation pipelines (Ansible / CI)

---

## ⚠️ Disclaimer | Running the Script

**Author:** Lalatendu Swain
**GitHub:** [https://github.com/Lalatenduswain](https://github.com/Lalatenduswain)
**Website:** [https://blog.lalatendu.info/](https://blog.lalatendu.info/)

This script is provided **as-is** and may require modifications based on your specific environment.
Use it at your own risk. The author is **not liable** for any damage or issues caused by its usage.

---

## 💖 Support & Donations

If you find this script useful and want to show your appreciation:

☕ **Buy Me a Coffee**
[https://www.buymeacoffee.com/lalatendu.swain](https://www.buymeacoffee.com/lalatendu.swain)

Your support helps maintain and improve open-source contributions.

---

## 🐞 Issues & Bug Reports

Found a bug or have a feature request?

📌 Submit an issue here:
[https://github.com/Lalatenduswain/apache-domain-list/issues](https://github.com/Lalatenduswain/apache-domain-list/issues)

---

## 🤝 Support or Contact

Need help or have questions?

* Open a GitHub issue
* Visit: [https://blog.lalatendu.info/](https://blog.lalatendu.info/)
* Connect via GitHub: [https://github.com/Lalatenduswain](https://github.com/Lalatenduswain)

---

⭐ If this repository helped you, consider starring it on GitHub!

```

---

If you want next:
- **CSV/JSON output version**
- **Apache → Nginx migration helper**
- **CI/CD linting for Apache vhosts**
- **Auto-export to documentation**

say the word.
```
