# 🐳 Inception - Projet Docker & Systèmes de l'école 42

## 📌 Description

**Inception** est un projet du cursus 42 qui vise à initier l'étudiant aux bases du **DevOps**, de la **virtualisation** et de la **gestion de services système** à l’aide de **Docker** et **Docker Compose**.

L’objectif est de concevoir une **infrastructure complète**, modulaire et sécurisée, qui s’exécute dans un environnement de **conteneurs**, en isolant chaque service dans son propre container. Ce projet introduit également des notions essentielles de **systèmes UNIX/Linux** et de **déploiement de services web.**

---

## 🎯 Objectifs pédagogiques

- Créer et configurer une infrastructure modulaire avec Docker
- Gérer des conteneurs et leurs volumes de manière indépendante
- Sécuriser les services avec TLS et bonnes pratiques systèmes
- Découvrir la configuration manuelle de services web (WordPress, NGINX, MariaDB…)
- Apprendre les fondements du **réseau**, des **volumes persistants** et des **scripts d'automatisation**

---

## 🏗️ Infrastructure à déployer

L’environnement contient les services suivants, tous **conteneurisés indépendamment** :

| Service      | Description |
|--------------|-------------|
| **NGINX**     | Serveur web + reverse proxy + HTTPS avec certificat SSL auto-signé |
| **WordPress** | CMS installé et configuré avec un utilisateur admin |
| **MariaDB**   | Base de données SQL pour WordPress, avec utilisateur dédié |
| **Adminer**   | Interface d’administration SQL légère |

---

## 🔐 Sécurité

- Certificats **SSL auto-signés** générés avec `openssl`
- Base de données avec mots de passe chiffrés et utilisateurs dédiés
- Permissions limitées dans les conteneurs
- Utilisation d’un **réseau Docker personnalisé** et d’un **volume par service**