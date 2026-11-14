----------------------------------------------------------------------------------
# <p align='center'> Suivis sur l'évolution du projet </p>
----------------------------------------------------------------------------------
## I. Fondamentaux
### A. Version
#### Alpha 0.1 (13-11-2026)
Cette Release ne concerne que les dépendances, nvidia, nvidia cuda Toolkit et LLAMA.
```
Fonctionnement
 - [OK] Installation des dépendances
 - [OK] Installation du pilote Nvidia
 - [OK] Téléchargement du dépôt LLAMA
 - [OK] Compilation du dépôt
 - [OK] Test de fonctionnement Appz
 - [OK] Batch de compilation avec "$CMAKE_ARGS"
 - [A activé] Compilation en mode silencieux
 - [OK] Désactivation du CCACHE (voir config/llama.conf > DGGML_CCACHE=OFF)
 - [OK] Service systemd /etc/systemd/system/llama-server.service
 - [Ponctuellement] Téléchargement de modèle
 - [OK] Batch de lancement de llama-server

Amélioration:
 - [XXXXXX] GPU Unlock
 - [XXXXXX] Liens symbolique llama-server vers /usr/bin/llama-server
```

<img width="504" height="419" alt="image" src="https://github.com/user-attachments/assets/4fc4c94f-0d1c-4da3-ace2-b365748ebe58" />


------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Garde-Fou / Sécurité

------------------------------------------------------------------------------------------------------------------------------------------------------
## III. Amélioration

