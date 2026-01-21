# 🚀 Guide de démarrage rapide — Package Audit

## Étapes pour démarrer un audit

### 1. Préparation (Jour 1-3)
```bash
# Cloner le repository
git clone https://github.com/abgage78/audit-reseau-securite.git
cd audit-reseau-securite

# Créer un dossier de travail pour ce client
mkdir -p ../audit-[CLIENT]-2026
cp *.md *.csv *.sh ../audit-[CLIENT]-2026/
cd ../audit-[CLIENT]-2026
```

### 2. Personnalisation des documents
- [ ] **SOW_Proposition.md** : Remplacer [Nom du client], ajuster budget et dates
- [ ] **ROE_template.md** : Compléter contacts, fenêtres d'exécution, périmètre
- [ ] **Planning_GANTT.csv** : Ajuster dates selon calendrier client
- [ ] **Email_templates.md** : Adapter avec infos spécifiques du projet

### 3. Signature et kick-off
- [ ] Faire signer le SOW par le client
- [ ] Faire signer le ROE par les deux parties
- [ ] Envoyer l'email de kick-off (template dans Email_templates.md)
- [ ] Planifier réunion de lancement

### 4. Collecte des accès
Demander au client :
- [ ] Diagrammes réseau & documentation existante
- [ ] Inventaire équipements (marque, modèle, version)
- [ ] Accès read-only : consoles cloud (AWS/Azure/GCP)
- [ ] Accès read-only : AD, SIEM, FW, switches
- [ ] Exports configs pare-feu existants
- [ ] Contacts techniques (réseau, sécu, AD, cloud)
- [ ] Fenêtres de maintenance si tests intrusifs prévus

### 5. Configuration des scripts
```bash
# Ouvrir Scripts_adaptes.sh
nano Scripts_adaptes.sh

# Décommenter et adapter les lignes d'appel de fonction
# Exemple pour Cisco:
# cisco_show "192.168.1.1" "audit-readonly" "$OUTDIR"

# Rendre le script exécutable
chmod +x Scripts_adaptes.sh

# Tester en mode dry-run d'abord (commenter les vraies commandes SSH/API)
./Scripts_adaptes.sh
```

### 6. Exécution de l'audit (suivre Planning_GANTT.csv)

#### Phase Discovery
- [ ] Lancer scans non-intrusifs (nmap, masscan)
- [ ] Exécuter Scripts_adaptes.sh sur tous les équipements
- [ ] Collecter exports configs
- [ ] Documenter architecture réseau réelle

#### Phase Analyse
- [ ] Parcourir Checklist_detaillee.csv
- [ ] Remplir colonne "Check (Y/N)" pour chaque item
- [ ] Noter preuves dans colonne "Evidence"
- [ ] Identifier gaps et findings

#### Phase Tests
- [ ] Notifier le client 24h avant (Email_templates.md)
- [ ] Lancer scans de vulnérabilités (Nessus/OpenVAS)
- [ ] Tests d'exploitation contrôlée selon ROE
- [ ] Tests Wi-Fi (rogue AP, auth, coverage)
- [ ] Tests AD (BloodHound, GPO review)

#### Phase Documentation
- [ ] Remplir Remediation_table.csv avec tous les findings
- [ ] Prioriser selon sévérité et impact business
- [ ] Assigner responsables (Owner) pour chaque item
- [ ] Définir dates cibles réalistes

### 7. Rapport et présentation
- [ ] Rédiger rapport technique avec preuves
- [ ] Rédiger rapport exécutif (résumé pour direction)
- [ ] Créer présentation PowerPoint
- [ ] Présenter résultats au client
- [ ] Répondre aux questions

### 8. Formation (optionnel)
- [ ] Planifier selon Programme_formation.md
- [ ] Préparer labs et exercices pratiques
- [ ] Délivrer formation 3 jours
- [ ] Remettre Attestation_formation.md signée

### 9. Suivi
- [ ] Re-test de validation après corrections client
- [ ] Clôture du projet
- [ ] Archiver tous les documents et preuves

---

## 📋 Checklist avant de commencer

### Documents signés
- [ ] SOW signé par les deux parties
- [ ] ROE signé par les deux parties
- [ ] NDA si applicable

### Accès collectés
- [ ] Cloud (AWS/Azure/GCP) - IAM read-only
- [ ] AD - compte read-only + RSAT tools
- [ ] Pare-feu - accès SSH/API read-only
- [ ] Switches - accès SSH read-only
- [ ] SIEM - accès console read-only
- [ ] Wi-Fi controller - accès read-only

### Outils installés
- [ ] nmap, masscan, netdiscover
- [ ] Nessus ou OpenVAS
- [ ] Burp Suite Professional
- [ ] BloodHound + SharpHound
- [ ] AWS CLI, Azure CLI, GCP gcloud
- [ ] Wireshark, tcpdump
- [ ] Python 3 + scripts custom
- [ ] Git pour versioning

### Communication
- [ ] Canal Slack/Teams avec client configuré
- [ ] Contacts d'escalade notés
- [ ] Calendrier partagé pour fenêtres de test

---

## 🔑 Commandes utiles

### Export configs réseau
```bash
# Créer dossier d'export daté
OUTDIR="./audit_exports_$(date +%Y%m%d_%H%M)"
mkdir -p "$OUTDIR"

# Exécuter scripts
./Scripts_adaptes.sh
```

### Scans découverte
```bash
# Scan rapide réseau entier
nmap -sn 10.0.0.0/8 -oA "$OUTDIR/discovery_full"

# Scan détaillé d'un subnet
nmap -sV -sC -p- 192.168.1.0/24 -oA "$OUTDIR/scan_subnet1"
```

### Import CSV dans Excel
```bash
# Sur Mac/Linux, ouvrir directement
open Planning_GANTT.csv
libreoffice Checklist_detaillee.csv

# Ou importer manuellement :
# Excel → Fichier → Importer → CSV → Délimiteur: virgule → Encodage: UTF-8
```

---

## 📞 Support

En cas de blocage ou question :
- Consulter EXPORT_COMPLET.md pour documentation détaillée
- Vérifier README.md pour vue d'ensemble
- Contacter abgage78 pour assistance

---

## ⚠️ Sécurité et conformité

- **TOUJOURS** travailler avec ROE signées
- **NE JAMAIS** exécuter tests intrusifs sans autorisation
- **TOUJOURS** anonymiser données personnelles dans rapports
- **NE JAMAIS** exfiltrer données client
- **TOUJOURS** chiffrer backups et exports
- **NE JAMAIS** commiter credentials dans git

---

✅ **Vous êtes prêt à démarrer l'audit !**

Bon courage — abbage78
