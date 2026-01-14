# PowerShell Toolbox

Production-Grade PowerShell Automations for Microsoft Security & Cloud Ops

This repository is the official companion to the **PowerShell Toolbox** book.

It contains curated, stable, production-ready PowerShell scripts designed to help security teams and cloud operators **audit, prove, and defend** real operational decisions—without turning your automation layer into an unreviewed liability.

This is not an experimental script dump. If a script lives here, it earned its place.

<br/>

## 🎯 Purpose of This Repository

Most PowerShell repos optimize for **quantity**.

**PowerShell Toolbox optimizes for judgment.**

This repo exists to:

- Provide copy/paste-clean PowerShell you can **actually run in real environments**
- Align scripts directly to **architectural decisions** (auditability, drift, privilege, hygiene)
- Support **repeatable security outcomes**, not automation theatre
- Serve as a stable reference that mirrors the book’s maturity arc

If a script lives here, it earned its place.

<br/>

## 📑 How This Repo Is Organized

The repository mirrors the structure of the PowerShell Toolbox book:

```text
Repo/
├── PowerShell Toolbox #1: Azure Network Audit/
├── PowerShell Toolbox #2: Azure Privileged RBAC Roles Audit/
├── PowerShell Toolbox #3: Snapshot Every GPO in One Pass/
├── PowerShell Toolbox #4: End of Life Devices and Software/
├── PowerShell Toolbox #5: Audit your Scripts with Invoke-ScriptAnalyzer/
```

<br/>

## 📖 Relationship to the Book

The book provides:
- The why
- The tradeoffs
- The mental models
- The decision surfaces

This repository provides:
- The how
- The exact scripts
- A maintained, versioned reference point

The book stands on its own. This repo makes it operationally useful.

<br/>

## 🔁 Versioning & Stability
- Scripts are versioned alongside book releases
- Breaking changes are documented in CHANGELOG.md
- Scripts are not silently modified
- Older behavior is preserved whenever reasonable

If a script changes here, it changes for a reason.

<br/>

## ⚠️ What This Repo Is Not

To avoid confusion, this repository is deliberately not:
- A dumping ground for half-finished experiments
- A general “PowerShell tricks” collection
- A beginner tutorial
- A replacement for broader script libraries

If you want the wider (messier) lab notebook, see my main PowerShell sandbox repo(s). This repo stays disciplined.

<br/>

## 🧠 Prerequisites & Assumptions

Most scripts assume:
- You can run PowerShell 7+ (recommended) or Windows PowerShell 5.1 where noted
- You understand the blast radius of tenant-wide reads
- You have appropriate access (Reader is often enough; sometimes you need more)
- You’re willing to review output before you treat it as truth

These scripts favor defensibility over convenience.

<br/>

## 🔑 License

See LICENSE for usage terms.

You are free to use these scripts in your environments. Attribution is appreciated, but discipline is required.

<br/>

## ⚡ More from DevSecOpsDad

Technical blog & experiments: [**🔗DevSecOpsDad.com**](www.devsecopsdad.com)

<div style="text-align:left; margin: 2.5em 0;">
    <p style="margin-top: 0.75em; font-size: 0.95em; opacity: 0.85;">
    📘 <strong>Ultimate Microsoft XDR for Full Spectrum Cyber Defense</strong><br/>
    Real-world detections, Sentinel, Defender XDR, and Entra ID — end to end
  </p>
  <a href="https://a.co/d/4vveVCI" target="_blank" rel="noopener noreferrer">
    <img 
      src="https://www.hanley.cloud/assets/img/Ultimate%20XDR%20for%20Full%20Spectrum%20Cyber%20Defense/cover11.jpg"
      alt="Ultimate Microsoft XDR for Full Spectrum Cyber Defense"
      style="max-width: 235px; box-shadow: 0 16px 40px rgba(0,0,0,.45); border-radius: 8px;"
    />
  </a>

<div style="text-align:left; margin: 2.5em 0;">
    <p style="margin-top: 0.75em; font-size: 0.95em; opacity: 0.85;">
    📘 <strong>KQL Toolbox</strong><br/>
    Turning Logs into Decisions in Microsoft Sentinel & Defender XDR
  </p>
  <a href="https://a.co/d/4vveVCI" target="_blank" rel="noopener noreferrer">
    <img 
      src="EEN421/KQL-Toolbox-Book/book/assets/img/KQL Toolbox Cover1.png"
      alt="Ultimate Microsoft XDR for Full Spectrum Cyber Defense"
      style="max-width: 235px; box-shadow: 0 16px 40px rgba(0,0,0,.45); border-radius: 8px;"
    />
  </a>

