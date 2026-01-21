# Programme d'audit professionnel — Réseau & Sécurité (entreprise ~200 utilisateurs)

Date : 2026-01-21
Auteur : Équipe d'audit abgage78

## 1. Objectif
Audit complet du réseau (3 sites, VPN site‑to‑site, accès distant, infra hybride cloud/on‑prem, Wi‑Fi enterprise & guest, télétravail important) :
- Évaluer posture de sécurité
- Identifier vulnérabilités critiques
- Vérifier conformité (RGPD, NIS2, ISO27001)
- Proposer plan d'action priorisé

## 2. Livrables
- Cartographie & inventaire complet
- Rapports : technique détaillé et exécutif
- Tableau de remédiation priorisé (CSV/Excel)
- Scripts & commandes d'audit (annexes)
- Planning GANTT + visuel
- Templates ROE & emails, attestation de formation
- Re‑test de validation (optionnel)

## 3. Hypothèses
- ROE signées et comptes read‑only fournis
- Fenêtres d'essai convenues pour tests intrusifs
- Accès aux consoles cloud et AD (scope read)
- Respect RGPD pour manipulations de données

## 4. Organisation & ressources
- Chef de mission (1) — coordination et reporting
- Auditeurs réseaux (1–2)
- Pentesters / Red Team (1–2)
- Expert cloud (part‑time)
- Liaison IT client (1)

## 5. Phases (synthèse)
- Préparation & ROE (3–5j)
- Discovery & inventaire multi‑site (7–10j)
- Analyse configs & contrôles (5–8j)
- Tests techniques (externe & interne, 7–12j)
- SIEM & journaux (3–5j)
- Rapport & remédiation (5–7j)
- Re‑test validation (optionnel)

## 6. Méthodes & outils
- Discovery : nmap, masscan, netdiscover
- Vuln scanning : Nessus / OpenVAS
- Web : Burp Suite, OWASP ZAP, nikto, sqlmap
- AD/Internal : BloodHound, CrackMapExec, PowerShell
- Wi‑Fi : Kismet, Ekahau, aircrack-ng (tests explicitement autorisés)
- Cloud : AWS CLI, Azure CLI, ScoutSuite, Prowler
- Traffic/IDS : tcpdump, Wireshark, Zeek, Suricata
- Config audit : RANCID/oxidized, scripts Python/PowerShell

## 7. Priorités de remédiation (exemples)
- 48h : fermer règles any‑any publiques, patchs critiques, isoler hôtes compromis, MFA sur accès remote
- 30j : corriger ACLs, centraliser logs, corriger accès cloud publics, activer EDR complet
- 90j+ : 802.1X sur LAN/Wi‑Fi, NAC, micro‑segmentation, amélioration SIEM/playbooks

## 8. KPI recommandés
- MTTR, % patchs appliqués à J+30/J+90, % équipements envoyant logs, % comptes MFA activés, temps moyen de détection

## 9. Sécurité et conformité
- Anonymiser preuves contenant données personnelles (RGPD)
- Processus d'escalade si découverte d'incident impactant la production
- Tous tests intrusifs soumis aux ROE
