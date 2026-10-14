# SkillChain · Atelier Web3

Un atelier de 3 h 30 pour découvrir la blockchain en construisant quelque chose : un système qui certifie des compétences sans autorité centrale.

Les participants déploient un smart contract de badges de compétences sur le testnet Sepolia, émettent des badges, les relisent depuis Python, puis passent par une petite DApp web.

## Contenu

| Fichier | Rôle |
|---|---|
| `SkillBadge.sol` | Le smart contract (Solidity) : émission et lecture de badges |
| `support.html` | Fiche de référence des participants : contrat annoté, Remix pas à pas, erreurs fréquentes |
| `skillchain_workshop.ipynb` | Notebook Python (web3.py) pour lire la blockchain : badges, blocs, transactions, hash |
| `index.html` | DApp web (ethers.js et MetaMask) pour émettre et vérifier des badges |
| `instructor/INSTRUCTEUR.md` | Guide formateur : déroulé minute par minute, textes à dire, plan B |

## Déroulé

| Bloc | Sujet | Durée |
|---|---|---|
| 0 | Ouverture sur XRPL Visualizer : « Comment certifier une compétence sans autorité centrale ? » | 15 min |
| 1 | Blockchain : hash, blocs, consensus | 30 min |
| 2 | Les bases de Solidity avec CryptoZombies | 25 min |
| 3 | Déploiement de SkillBadge sur Sepolia | 45 min |
| 4 | Wallets, gas, testnet | 15 min |
| 5 | Lecture de la blockchain en Python (Colab) | 30 min |
| 6 | DApp web, démo guidée | 20 min |
| 7 et 8 | Présentation de la spécialisation, questions | 20 min |

## Lancer le notebook

[Ouvrir dans Google Colab](https://colab.research.google.com/github/Noahxel/SDC-WEB3/blob/main/skillchain_workshop.ipynb), puis remplacer l'adresse du contrat par la vôtre dans la cellule 2.

## Prérequis côté participants

MetaMask installé, réseau de test Sepolia activé et quelques ETH de test récupérés sur un faucet. Le guide formateur prévoit un plan B si ce n'est pas le cas.

---

Conçu et animé par [Noah Le Veve](https://github.com/Noahxel) en 2026.
