# Universal Minecraft Cheat & Forensic Instance Scanner (`lwkyyy`)

A fast, lightweight, universal PowerShell anticheat and forensic scanner built to analyze **any Minecraft JAR, instance, or mod loader across all game versions** (1.7.10, 1.8.9, 1.12.2, 1.16.5, 1.20, to 1.21+).

---

## ⚡ Quick Run (Short PowerShell Command)

### From Run (`Win + R`) or CMD:
```powershell
powershell -ep bypass -c "irm tinyurl.com/22ekwnlr|iex"
```

### From an open PowerShell window:
```powershell
irm tinyurl.com/22ekwnlr|iex
```

*(Direct GitHub URL: `powershell -ep bypass -c "irm https://raw.githubusercontent.com/doistdamforu-svg/UniversalCheatScanner/main/scan.ps1|iex"`)*

---

## 🚀 Key Capabilities

### 1. Universal Version & Loader Coverage
- **Game Versions**: 1.7.10 -> 1.8.9 -> 1.12.2 -> 1.16.5 -> 1.20 -> 1.21+
- **Mod Loaders**:
  - **Fabric Loader** (including `.fabric/processedMods` and core loader jars)
  - **Forge** (1.7/1.8/1.12 coremods and modern Forge `mods.toml`)
  - **NeoForge**
  - **Quilt Loader**
  - **Vanilla / Injected Clients** (OptiFine, Lunar, Badlion, Feather)
- **Auto-Discovered Launchers**:
  - **Modrinth App (Theseus)**: All profiles, instance mods, and global `meta/libraries`
  - **Standard `.minecraft`**: `mods/`, `libraries/`, and `versions/`
  - **Prism Launcher & MultiMC**: All custom instance directories
  - **CurseForge App**: All installed instances
  - **Feather Client**: User mods and core assets
  - **Custom / Drag & Drop**: Any folder or individual `.jar` file

---

### 2. Deep Heuristic & String Analysis Engine
The scanner performs multi-layer inspection on `.class`, `.json`, and `MANIFEST.MF` files:

* **380+ Cheat Client Signatures**:
  * *Modern & CPvP*: **Doomsday**, **NovaClient**, **Boze**, **Dqrkis**, **Orchard**, **Zenith**, **Velaris**, **Karma**, **Pika**, **Calcium**, **Zelith**, **Xenon**, **Echo**, **Catlean**, **Gypsy**, **Hellion**, **VirginClient**, **Prestige**, **198Macros**, **Delta**, **Elysian**, **Onyx**, **Lumina**, **Momentum**, **Raven B++**, etc.
  * *1.8.9 / 1.12.2 Ghost & Blatant*: **Vape** (`vape.gg`, `VapeLite`), **Meteor**, **LiquidBounce**, **Wurst**, **Sigma**, **Aristois**, **Impact**, **Azura**, **Argon**, **Krypton**, **Future**, **Rusherhack**, etc.
* **Combat & Macro Modules**:
  * **TriggerBot**, **AimAssist**, **SilentAim**, **BowAim**, **AimLock**, **HeadSnap**
  * **KillAura**, **ClickAura**, **AutoClicker**, **DoubleClicker**, **JitterClick**, **ButterflyClick**
  * **ReachHack**, **HitboxExpand**, **AntiKB**, **VelocitySpoof**, **GrimVelocity**, **AutoCrit**, **CritBypass**
* **CPvP, Anchor & Totem Modules (1.9 - 1.21+)**:
  * **AutoCrystal**, **CwCrystal**, **AutoHitCrystal**, **AutoDoubleHand**, **dontPlaceCrystal**, **canPlaceCrystalServer**
  * **AutoAnchor**, **DoubleAnchor**, **SafeAnchor**, **AirAnchor**, **AnchorMacro**, **MarlowAnchor**, **AnchorAction**
  * **AutoTotem**, **InventoryTotem**, **HoverTotem**, **ForceTotem**, **TotemOffhand**, **Strict One-Tick**
  * **AutoPot**, **AutoPotRefill**, **ShieldBreaker**, **ShieldDisabler**, **AutoMace**, **MaceSwap**, **SpearSwap**, **StunSlam**, **AutoBed**
* **Movement, ESP & Bypass Modules**:
  * **FlyHack**, **PacketFly**, **SpeedHack**, **BHop**, **NoSlow**, **NoFallDamage**, **FastPlace**, **FastBreak**, **ScaffoldWalk**, **FastBridge**
  * **GrimBypass**, **VulcanBypass**, **MatrixBypass**, **AACBypass**, **WatchdogBypass**, **FakeLag**, **PingSpoof**
  * **PlayerESP**, **StorageESP**, **BlockESP**, **XRayHack**, **NewChunks**, **TunnelFinder**, **BaseFinder**, **Freecam**, **NoClip**
* **Fullwidth Unicode Evasion Detection**:
  * Automatically detects and converts obfuscated wide characters (e.g. `Ａｕｔｏ Ｃｒｙｓｔａｌ`, `Ｔｒｉｇｇｅｒ Ｂｏｔ`, `Ｓｉｌｅｎｔ Ｒｏｔａｔｉｏｎｓ`) and matches them against the cheat signature database.
* **Bytecode Trojans & Stealers**:
  * Detects `Runtime.getRuntime().exec()` arbitrary command execution.
  * Detects HTTP remote payload downloaders (`HttpURLConnection` + `FileOutputStream`).
  * Detects HTTP data exfiltration and embedded Discord webhooks (`discord.com/api/webhooks`).
  * Identifies known cheat obfuscators (*Skidfuscator, Paramorphism, Radon, Bozar, Branchlock, Binscure, Zelix KlassMaster, JNIC, Scuti, Smoke*).
  * Unpacks and inspects **Nested JARs (Jar-in-Jar)** recursively.
* **Active JVM Runtime Injection Scanner**:
  * Detects suspicious external `-javaagent:`, `-Xbootclasspath`, native agents, and remote JDWP debug hooks on any running `java.exe` / `javaw.exe` (with automatic whitelisting of official launcher agents like Modrinth Theseus).

---

### 3. Live RAM Memory & Anti-Self-Destruct Forensics
The scanner includes forensic detection specifically engineered to catch cheats that **self-destruct**, timestomp, and redownload clean mods:

* **Live Process RAM Memory Scanner (C# Win32 Engine)**:
  * Uses `OpenProcess`, `VirtualQueryEx`, and `ReadProcessMemory` to scan committed JVM heap memory in real time.
  * Catches active cheats and **terminated / self-destructed cheat strings** that linger in Java memory even after files on disk have been removed.
* **Memory-to-Disk Divergence (The #1 ScreenShare Smoking Gun)**:
  * Correlates live RAM traces with disk contents. If memory contains cheat signatures (`AimAssist`, `HoverTotem`, `ShieldDisabler`, `MaceSwap`, etc.) while mods on disk are clean/verified from Modrinth, the scanner flags an immediate **`[CRITICAL] Memory/Disk Divergence`** alert.
* **Runtime Mod Hot-Swapping Detection**:
  * Compares Minecraft's process start time (`proc.StartTime`) against the `CreationTime` and `LastWriteTime` of every mod in the active instance.
  * Detects when a mod was downloaded or replaced on disk *while Minecraft was actively running*.
* **NTFS Timestomping & Timestamp Paradoxes**:
  * Catches files where `LastWriteTime < CreationTime` (physically impossible under normal OS operations).
  * Detects zero sub-second timestamps (`.000ms`), characteristic of standard PowerShell/Win32 `SetFileTime` timestomping scripts.
* **Fresh Mod Redownload Footprint**:
  * Detects when verified Modrinth mods were downloaded very recently (during the active session or within the last 4 hours) to replace cheat jars.
* **PowerShell Console History Audit**:
  * Inspects `ConsoleHost_history.txt` for self-destruct commands (`SetFileTime`, `LastWriteTime`, `cdn.modrinth.com`, `clean.bat`, `del /f /q`).
* **Prefetch Execution Tracing**:
  * Inspects `C:\Windows\Prefetch` for recent executions of external downloaders or anti-forensic tools (`CURL.EXE`, `BITSADMIN.EXE`, `CERTUTIL.EXE`, `FSUTIL.EXE`).

---

## 🛠️ Usage Methods

### Method 1: 1-Click Launch (Double-Click)
Double-click [`Run-Scanner.bat`](file:///c:/Users/Piyush/Desktop/doist%20jar%20analyzer/Run-Scanner.bat).
* Displays an interactive menu of all detected Minecraft profiles and launchers.
* Select an instance number or choose **`[A]`** to scan everything.

### Method 2: Drag and Drop
Drag and drop **any `.jar` file** or **any folder** directly onto [`Run-Scanner.bat`](file:///c:/Users/Piyush/Desktop/doist%20jar%20analyzer/Run-Scanner.bat) to scan it immediately.

### Method 3: PowerShell CLI Options
```powershell
# Interactive launcher detection menu
.\scan.ps1

# Scan any specific folder or modpack
.\scan.ps1 -Target "C:\path\to\mods"

# Scan a single JAR file directly
.\scan.ps1 -Target "C:\path\to\mod.jar"

# Scan ALL installed Minecraft & Modrinth instances at once
.\scan.ps1 -All

# Include core Fabric / Forge Loader JARs in the scan
.\scan.ps1 -IncludeLoader

# Run 100% offline (skips Modrinth API verification)
.\scan.ps1 -Offline

# Export detailed results to a JSON report
.\scan.ps1 -ExportJson "scan-report.json"
```
