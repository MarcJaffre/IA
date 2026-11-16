clear;

cat > $HOME/india.sh << EOF
#!/usr/bin/bash

clear;

# ====================================================================
# Variables #
# ========= #
DEPOT=https://github.com/MarcJaffre/IA.git;

# ====================================================================
# Purge #
# ===== #
rm -r IA 2>/dev/null;

# ====================================================================
# Telechargement #
# ============== #
git clone --quiet $DEPOT;

# ====================================================================
# Lancement #
# ========= #
bash $WORKDIR/IA/workspaces/debian_base.sh;
EOF

chmod +x $HOME/india.sh;

$HOME/india.sh;
