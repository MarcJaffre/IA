----------------------------------------------------------------------------------
# <p align='center'> Suivis sur l'évolution du projet </p>
----------------------------------------------------------------------------------
## I. Fondamentaux
### A. Version
#### Alpha 0.2 (16-11-2026)
Le menu permet d'avoir un meilleur contrôle du déploiement du projet.
```
Menu.sh
 - [OK] Création d'un menu de sélection

Base:
 - [OK] Installation des dépendances
 - [OK] Installation du pilote Nvidia
 - [OK] Installation de Nvidia Unlock GPU

LLAMA:
 - [OK] Téléchargement du dépôt LLAMA
 - [OK] Compilation du dépôt LLAMA
 - [??] Menu dédiée au Téléchargement de modèle
 - [??] Batch de lancement de llama-server
 - [??] Test de fonctionnement Appz
 - [??] Service systemd /etc/systemd/system/llama-server.service

OpenWebUI:
 - [??] Téléchargement du dépôt 
 - [??] Compilation du dépôt OpenWebUI
 - [??] Pré-configuration de OpenWebUI (Interconnecté à LLAMA)
 - [??] Batch de lancement de OpenWebUI
 - [??] Test de fonctionnement Appz
 - [??] Service systemd /etc/systemd/system/openWebUI.service
```



#### Alpha 0.1 (13-11-2026)
```
LLAMA:
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

OpenWebui:
 - [XX] Installation des dépendances
 - [XX] Téléchargement du dépôt 
 - [XX]  
 - [XX]  
 - [XX]  
 - [XX]  
 - [XX]  


Amélioration:
 - [XXXXXX] GPU Unlock
 - [XXXXXX] Liens symbolique llama-server vers /usr/bin/XXXX-server
```




<img width="504" height="419" alt="image" src="https://github.com/user-attachments/assets/4fc4c94f-0d1c-4da3-ace2-b365748ebe58" />


------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Garde-Fou / Sécurité

------------------------------------------------------------------------------------------------------------------------------------------------------
## III. Amélioration

