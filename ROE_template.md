# Template : Rules of Engagement (ROE) — Audit Sécurité Réseau

Client : [Nom du client]
Périmètre : [sites, cloud, AD, Wi‑Fi, etc.]
Dates : 2026-02-03 -> 2026-03-17
Contacts :
- Responsable IT : [Nom, email, tel]
- Responsable sécurité : [Nom, email, tel]
- Chef de mission : abgage78, [email, tel]

## 1. Objectifs
- Définir actions autorisées (discovery, scans, exploitation contrôlée)
- Définir actions interdites (DoS, modification données, exfiltration)
- Formaliser fenêtres et procédures d'escalade

## 2. Autorisations
- Scans réseau non-intrusifs : OUI
- Vulnerability scanning : OUI
- Tests d'exploitation (pentest interne) : OUI (fenêtres définies)
- Social engineering : À DÉFINIR
- Red team exercises : À DÉFINIR

## 3. Fenêtres d'exécution
- Tests non-intrusifs : 24/7
- Tests intrusifs : [ex. Lun-Ven 09:00–17:00 CET]
- Services exclus : [liste]

## 4. Notifications
- Préavis 24h avant tests intrusifs
- Escalade immédiate si incident réel détecté

## 5. Outils autorisés
nmap, Nessus, Burp Suite, BloodHound, CrackMapExec, Metasploit (avec accord), aircrack-ng (Wi-Fi tests)

## 6. Confidentialité & RGPD
- Anonymisation des preuves contenant PII
- Confidentialité stricte des résultats

## 7. Signatures
Client : ____________________ Date : __ / __ / __
Auditeur : __________________ Date : __ / __ / __
