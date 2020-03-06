# PowerShell-WebServer
Ein kleiner PowerShell Webserver mit Control Panel

## Getting Started

### Was wird benötigt?

Was wird für die Ausführung des Webservers benötigt?

```
PowerShell 5.1 Core
.Net-Framework 3.5 oder höher
Windows System (Pfes wird noch nicht unterstüzt)
Adminrechte auf dem Host
```

### Download:

Zuerst muss das Projekt heruntergeladen werden, das kann entweder mit einem ```git clone``` geschehen oder der neuste Release kann heruntergeladen werden (Empfohlen)

```bash
git clone https://github.com/MinersWin/PowerShell-WebServer.git
```

oder auch

```bash
wget https://github.com/MinersWin/PowerShell-WebServer/releases/download/v.1.0/WebServer.zip
```

## WebServer ausführen:

#### Einfach WebServer.ps1 mit ***Adminrechten*** ausführen

```powershell
.\WebServer.ps1
```

## WebServer ohne GUI Nutzen

### Standartconfiguration ausführen:

(mit Adminrechten)

```
.\WebServer_Logic.ps1
```

### Argumente anfügen:

```powershell
#Könnte so oder ähnlich aussehen:
.\WebServer_Logic.ps1 -root C:\ -http 80,8080 -https 433
```

#### -root

Der Ordner aus welchem der Server die Daten bereitstellt

###### Beispiel:

```.\WebServer_Logic.ps1 -root C:\```

#### -hosts

Die IPs, auf welche der Server hören soll

###### Beispiel:

```.\WebServer_Logic.ps1 -hosts 127.0.0.1,192.168.1.1,10.10.10.1,```

oder auch

```.\WebServer_Logic.ps1 -hosts *```

Mit * hört der Server auf alle IPs

#### -http

Die HTTP Ports auf welche gehört werden sollen

Wenn HTTP Ports angegeben werden wird der Server ausschließlich unter diesen Ports erreichbar sein

###### Beispiel:

```.\WebServer_Logic.ps1 -http 80,8080,8443,8004```

#### -https

Die HTTPS Ports auf welche gehört werden sollen

Wenn HTTPS Ports angegeben werden wird der Server ausschließlich unter diesen Ports erreichbar sein

###### Beispiel:

```.\WebServer_Logic.ps1 -https 443,8987,9970```

**WICHTIG: SSL Wird noch nicht unterstüzt!**

#### -NoFolderListing

Deaktiviert das Anzeigen der Ordner. Es können Dateien nur direkt aufgerufen werden.

###### Beispiel:

```.\WebServer_Logic.ps1 -NoFolderListing```

## Benutzte Tools

* [PowerShell](https://github.com/PowerShell/PowerShell) - Die Programmiersprache
* [ISESteroids](http://www.powertheshell.com/isesteroids/) - Eine IDE
* [Visual Studio Code](https://code.visualstudio.com) - Eine andere IDE
* [PowerShell Pro Tools](https://ironmansoftware.com/powershell-pro-tools/) - Benutzt um die GUI und ein paar andere Features zu generieren

## Beteiligen

Sollten Fehler am Code gefunden werden oder du willst ihn nur verbessern, einfach das Projekt forken, die Änderungen durchführen und ein Pull Request aufmachen. Ich werde mir die Änderungen anschauen und wenn alles in Ordnung ist in diesen Branch übernehmen.

## Authors

* **MinersWin** - *GUI, Error Pages, Bugfixes, Project Owner* - [MinersWin](https://github.com/MinersWin)
* **Mobatilo** - *Compiling*, Testing - [Mobatilo](https://github.com/Mobatilo)
* **fearthecowboy** - *adhoc Server, Initial Idea* - [Garrett Serack](https://github.com/fearthecowboy)

Siehe auch: [beteiligt](https://github.com/MinersWin/PowerShell-WebServer/contributors) an diesem Projekt.

## License

Das Projekt unterliegt der Apache 2.0 Lizenz - siehe [LICENSE.md](LICENSE.md)

