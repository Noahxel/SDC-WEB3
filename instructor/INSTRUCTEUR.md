# Guide instructeur — Workshop SkillChain (3h30)

## Fichiers du workshop

| Fichier | Usage | Visible étudiants |
|---|---|---|
| `SkillBadge.sol` | Smart contract à déployer dans Remix | ✓ |
| `support.html` | Fiche de référence — ouverte pendant Blocs 2 et 3 | ✓ |
| `index.html` | DApp frontend — démo Bloc 6 | ✓ |
| `skillchain_workshop.ipynb` | Notebook Colab — Bloc 5 | ✓ |
| `instructor/INSTRUCTEUR.md` | Ce fichier | ✗ (guide formateur) |

---

## Avant le workshop (J-1)

### 1. Contrat formateur

> Déjà déployé : `0x679E528c0712cA4F1Dbe37Ab99Dfd66855091fa8` sur Sepolia.
> Refaire uniquement si le contrat n'est plus accessible.

1. remix.ethereum.org → `SkillBadge.sol` → Compiler (0.8.x)
2. Deploy → `Sepolia Testnet - MetaMask` → Confirmer → Copier l'adresse
3. Mettre à jour `index.html` ligne `CONTRACT_ADDRESS`

### 2. StackBlitz

Déjà configuré avec l'adresse du contrat formateur. Vérifier que le lien public fonctionne.

### 3. Gist pour le contrat étudiant

1. gist.github.com → Nouveau Gist public avec le contenu de `SkillBadge.sol`
2. Copier le lien → le projeter au Bloc 3

### 4. Demander aux étudiants (J-3 minimum)

Envoyer ce message avant le workshop :
> "Installez MetaMask (metamask.io) sur votre navigateur, créez un wallet, activez le réseau Sepolia et récupérez des ETH de test sur sepoliafaucet.com. Si vous bloquez, on règle ça au début du workshop."

- Prévoir un compte formateur avec 2–3 ETH Sepolia pour les étudiants sans ETH
- Si plus de 3 étudiants sans ETH → prioriser les binômes (1 wallet par binôme suffit)

---

## Déroulé en un coup d'œil

```
00:00  BLOC 0  Ouverture XRPL Visualizer                    15 min
               "Comment certifier une compétence sans autorité centrale ?"
00:15  BLOC 1  Blockchain : hash, blocs, consensus           30 min
               "La blockchain rend ça possible — voici pourquoi"
00:45  BLOC 2  Solidity — CryptoZombies ch.1-8              25 min
               "Voici la langue pour le programmer"
01:10  BLOC 3  Déploiement SkillBadge                        45 min
               "On programme notre réponse et on la déploie"
01:55  PAUSE                                                  10 min
02:05  BLOC 4  Wallets, gas, testnet                         15 min
               "Voici ce que ça coûte et pourquoi"
02:20  BLOC 5  Notebook Colab                                 30 min
               "On lit ce qu'on a créé sur le réseau"
02:50  BLOC 6  DApp frontend — démo guidée                   20 min
               "On crée l'interface pour l'utiliser"
03:10  BLOC 7  Présentation de la spécialisation             10 min
03:20  BLOC 8  Q&A + clôture                                 10 min
```

---

## URLs à avoir ouvertes avant de commencer

```
BLOC 0  XRPL Visualizer    https://xrpl-visualizer.vercel.app
BLOC 1  Anders Hash        https://andersbrownworth.com/blockchain/hash
        Anders Blockchain  https://andersbrownworth.com/blockchain/blockchain
BLOC 2  CryptoZombies      https://cryptozombies.io
        Support étudiant   support.html (dans ce dépôt)
BLOC 3  Remix IDE          https://remix.ethereum.org
        Sepolia Faucet     https://sepoliafaucet.com
        Etherscan Sepolia  https://sepolia.etherscan.io
BLOC 5  Colab notebook     https://colab.research.google.com/github/Noahxel/SDC-WEB3/blob/main/skillchain_workshop.ipynb
BLOC 6  StackBlitz DApp    https://stackblitz.com/edit/stackblitz-starters-1tfnzqhh?file=index.html
```

---

## BLOC 0 — Ouverture (15 min)
> **Fil rouge :** poser la question centrale à laquelle tout le workshop répond.

Ouvrir le Visualizer sans rien dire. Attendre 15 secondes.

> "Qu'est-ce que vous voyez ?"

Laisser répondre.

> "Ces sphères sont des nœuds — des serveurs répartis dans le monde entier. Ces lignes, ce sont des transactions en temps réel. Personne ne contrôle ce réseau. Il n'y a pas de CEO, pas de bouton off.
>
> Et pourtant, tout le monde est d'accord sur ce qui s'est passé. Comment est-ce possible ?
>
> C'est la question à laquelle on va répondre aujourd'hui. Et pour que ce soit concret : dans 3h30, vous aurez déployé votre propre système sur un réseau similaire — avec votre propre adresse, vos propres transactions, visibles par n'importe qui dans le monde.
>
> Le système qu'on va construire s'appelle SkillChain : certifier des compétences sur la blockchain, sans avoir besoin d'ETNA, de LinkedIn, ou de personne. La preuve est dans le code, et le code est sur le réseau. C'est ça, le Web3."

---

## BLOC 1 — Blockchain (30 min)
> **Fil rouge :** expliquer pourquoi la blockchain est la réponse au problème posé en Bloc 0.
> Phrase d'intro : *"Pour certifier sans autorité centrale, il faut comprendre ce qui rend la blockchain fiable."*

### 1.1 Le problème résolu (7 min)

> "Imaginons : vous terminez votre Bachelor, vous cherchez un job. Vous envoyez votre diplôme en PDF. Comment le recruteur sait qu'il est authentique ?"

Laisser répondre.

> "Il fait confiance à un tiers. Notaires, banques, États — des intermédiaires qui certifient la vérité depuis des siècles.
>
> Le problème : ce tiers peut être corrompu, faire faillite, être piraté. En 2020, une étude Harvard : 1 diplôme sur 5 vérifié sur LinkedIn est falsifié.
>
> La blockchain remplace la confiance en une institution par la confiance en des mathématiques. Des règles que tout le monde peut vérifier, que personne ne peut modifier unilatéralement."

### 1.2 Le hash via Anders (8 min)

Ouvrir **andersbrownworth.com/blockchain/hash**

Taper `Bonjour` → montrer le hash. Taper `bonjour` → hash totalement différent.

> "J'ai changé une seule lettre. Le hash est méconnaissable. C'est l'effet avalanche.
>
> Trois propriétés clés : déterministe (même entrée = même sortie, toujours), irréversible (impossible de retrouver la donnée depuis le hash), effet avalanche (1 bit change = hash totalement différent).
>
> Si je vous donne le hash d'un document et que vous recalculez celui que vous avez reçu — et qu'ils correspondent — le document n'a pas été modifié. Mathématiquement garanti."

### 1.3 La structure en blocs (10 min)

Ouvrir **andersbrownworth.com/blockchain/blockchain**

> "Un bloc contient : un numéro, un nonce, des données, le hash du bloc précédent, et son propre hash. Modifier une transaction dans le bloc 2 invalide les blocs 2, 3, 4..."

Modifier un bloc → les suivants passent au rouge.

> "Pour corriger le bloc 2, il faut recalculer son hash — et tous les suivants. C'est le rôle du nonce : trouver un nombre tel que le hash du bloc commence par N zéros. Sur Bitcoin, 19 zéros, 10 minutes en moyenne. Modifier le passé = refaire ce travail pour chaque bloc. Mathématiquement infaisable."

---

## BLOC 2 — CryptoZombies (25 min)
> **Fil rouge :** apprendre la syntaxe Solidity en faisant le lien explicite avec SkillBadge à chaque étape.
> Phrase d'intro : *"On sait pourquoi la blockchain fonctionne. Maintenant on apprend la langue pour y programmer notre solution."*
> **Support étudiant :** faire ouvrir `support.html` → section "Du Zombie au Badge" — ils gardent cette page ouverte pendant CryptoZombies ET pendant Remix.

Ouvrir **cryptozombies.io** → Solidity Path → Lesson 1

> "CryptoZombies vous apprend Solidity en construisant un jeu. Vous avancez en autonomie, je fais les mêmes chapitres en parallèle projeté."

**Faire les chapitres 1 à 8.** *(ch.1-6 essentiels — ch.7-8 si le temps le permet)*

| Chapitre | Concept | Lien SkillBadge |
|---|---|---|
| 1 | pragma, contract | Structure du contrat |
| 2 | uint, variables d'état | `uint256 issuedAt` |
| 3 | Math | — |
| 4 | struct | La struct `Badge` |
| 5 | Arrays, push | `Badge[] public badges` |
| 6 | Fonctions, visibilité | `issueBadge`, `getBadge` |
| 7 | Structs + arrays | `badges.push(Badge(...))` |
| 8 | private/public, view | `view` = gratuit à appeler |

Transition :

> "Vous venez d'apprendre la syntaxe Solidity dans un sandbox. Maintenant on passe à la vraie chose : un vrai contrat, sur un vrai réseau, avec votre vraie adresse."

---

## BLOC 3 — Déploiement SkillBadge (45 min)
> **Fil rouge :** déployer la réponse au problème posé en Bloc 0.
> Phrase d'intro : *"Vous savez comment ça marche, vous connaissez la syntaxe. On va maintenant déployer notre système de certification."*
> **Support étudiant :** `support.html` toujours ouvert → sections "Contrat annoté", "Remix pas à pas", "Erreurs fréquentes".

### Setup MetaMask + Sepolia (8 min)

1. **Installer MetaMask** → metamask.io → Add to browser → Créer un wallet → noter la seed phrase
2. **Réseau Sepolia** → MetaMask → icône réseau → Afficher les réseaux de test → Sepolia ✓
3. **ETH de test** → sepoliafaucet.com → coller son adresse → 0.5 ETH reçus en ~30 sec

### Remix — Mise en place + lecture guidée du contrat (15 min)

**Ce que font les étudiants (actions) :**
1. Ouvrir remix.ethereum.org
2. Panneau gauche → icône dossier → "New File" → nommer `SkillBadge.sol`
3. Coller le code depuis le Gist projeté
4. Ouvrir `support.html` dans un autre onglet → rester sur la section "Contrat annoté"

**Ce que fait l'instructeur (lecture à voix haute) :**

Parcourir le contrat ligne par ligne en projetant Remix. Pour chaque bloc, pointer la ligne dans Remix ET la ligne correspondante dans `support.html`. Les étudiants suivent sur leur écran.

Script de lecture :

> **struct Badge** — "C'est le chapitre 4 de CryptoZombies. Un type composite. Ici on stocke les 4 informations qui définissent une certification : qui est certifié, quelle compétence, quand, par qui."

> **Badge[] public badges** — "Chapitre 5. Un tableau de Badge, stocké sur la blockchain. 'public' génère automatiquement un getter — Solidity crée la fonction de lecture pour vous."

> **mapping(address => uint256[])** — "Ça c'est nouveau. Une table clé-valeur : pour chaque adresse étudiant, on stocke la liste des index de ses badges. Accès instantané sans scanner tout le tableau."

> **event BadgeIssued** — "Nouveau aussi. Un log permanent émis sur la blockchain à chaque badge créé. Visible sur Etherscan. Pas modifiable, pas supprimable."

> **issueBadge()** — "Chapitre 6. La seule fonction qui écrit sur la blockchain — elle coûte du gas. Notez block.timestamp : c'est l'horodatage fourni par le validateur du bloc. Et msg.sender : c'est l'adresse qui appelle la fonction — automatiquement l'émetteur du badge."

> **getBadgesOf() / getBadge()** — "Chapitre 8. Les fonctions 'view' — lecture seule, gratuites. Elles ne modifient rien, donc pas de transaction, pas de gas."

Conclusion :
> "Ce contrat de 47 lignes répond au problème posé en début de workshop : certifier une compétence sans autorité centrale. Pas de serveur, pas d'admin, pas de base de données. Le code tourne sur des milliers de nœuds simultanément. Vous êtes sur le point de le déployer."

### Compilation (2 min)

Panneau Solidity Compiler → version 0.8.x → Compile → coche verte attendue.

### Déploiement individuel (10 min)

1. Panneau Deploy & Run → Environment : `Sepolia Testnet - MetaMask`
2. Vérifier : MetaMask sur Sepolia, solde > 0
3. **Deploy** → Confirmer dans MetaMask → attendre ~15 sec
4. **Copier et noter l'adresse du contrat** — c'est leur adresse personnelle, personne d'autre ne l'a
5. Ouvrir `https://sepolia.etherscan.io/address/LEUR_ADRESSE`

### Interaction depuis Remix (10 min)

Après le déploiement, le contrat apparaît dans **"Deployed Contracts"** en bas du panneau Deploy & Run.
Cliquer sur la flèche `▶` pour le déplier — toutes les fonctions apparaissent.

```
Deux types de boutons :
  🟠 Orange  = fonction qui ÉCRIT sur la blockchain (coûte du gas, ouvre MetaMask)
  🔵 Bleu    = fonction qui LIT la blockchain (gratuit, résultat immédiat)
```

**Étape 1 — Émettre un badge sur soi-même** 🟠
1. Cliquer sur `▶` à gauche de `issueBadge` pour déplier ses champs
2. Champ `student` : coller **sa propre adresse MetaMask** (copier depuis MetaMask)
3. Champ `skill` : taper `Solidity Basics`
4. Cliquer le bouton orange **transact**
5. MetaMask s'ouvre → vérifier réseau Sepolia → cliquer **Confirmer**
6. Attendre ~15 sec → la console Remix affiche une ligne verte ✓

**Étape 2 — Émettre un badge vers un voisin** 🟠
1. Mêmes champs `issueBadge`
2. `student` : adresse MetaMask du voisin (il la dicte ou l'envoie par message)
3. `skill` : `Blockchain Fundamentals`
4. Cliquer **transact** → confirmer MetaMask

**Étape 3 — Lire ses badges** 🔵
1. Champ `getBadgesOf` : coller sa propre adresse → cliquer **call**
2. Résultat immédiat sous le bouton : `0: uint256[]: 0` → signifie "badge à l'index 0"
3. Champ `getBadge` : entrer `0` → cliquer **call**
4. Résultat : les 4 champs s'affichent — adresse, compétence, timestamp, émetteur

**Étape 4 — Vérifier sur Etherscan**
1. Ouvrir `https://sepolia.etherscan.io/address/ADRESSE_DU_CONTRAT`
2. Onglet **Transactions** → les deux TX `issueBadge` sont listées
3. Cliquer une TX → onglet **Logs** → l'event `BadgeIssued` est décodé avec ses paramètres

> "Votre contrat est déployé. Son code est immuable — personne ne peut le modifier, pas même vous. Les badges que vous émettez y sont stockés pour toujours."

---

## BLOC 4 — Wallets, Gas, Testnet (15 min)
> **Fil rouge :** comprendre ce que coûte et ce que représente ce qu'on vient de faire.
> Phrase d'intro : *"Vous venez de déployer un contrat et d'émettre des badges. On va maintenant décortiquer ce qui s'est passé sous le capot."*
> **Point clé :** ouvrir Etherscan sur LEUR transaction `issueBadge` — pas une transaction générique.

### Wallet (5 min)

> "Un wallet ne contient pas de crypto. Les tokens sont sur la blockchain. Votre wallet, c'est votre identité cryptographique."

```
Clé privée  (256 bits aléatoires)
     ↓ ECDSA secp256k1
Clé publique
     ↓ keccak256, 20 derniers octets
Adresse     (0x...)
```

> "La seed phrase régénère la clé privée. Perdue = fonds inaccessibles. Volée = wallet vidé. Pas de hotline, pas de support."

### Gas (7 min)

Ouvrir la transaction `issueBadge` de l'étudiant sur Etherscan → onglet Overview → montrer "Gas Used".

> "Vous avez payé ça. Voici pourquoi."

```
Chaque opération EVM a un coût en gas :
  SSTORE (écrire une nouvelle valeur)  : 20 000 gas
  SLOAD  (lire une valeur)             :    800 gas
  ADD                                  :      3 gas
  LOG    (émettre un event)            :    375+ gas

Frais = gas utilisé × gas price (en Gwei, 1 Gwei = 10⁻⁹ ETH)
issueBadge() ≈ 47 000 gas → sur mainnet à 20 Gwei ≈ 3-4€
```

> "Sur Sepolia, le gas ne vaut rien. Sur mainnet, chaque appel à issueBadge coûte de l'argent réel. Optimiser le code Solidity = réduire les coûts pour vos utilisateurs."

### Testnet vs Mainnet (3 min)

```
Mainnet  : vrai réseau, vrais ETH, production
Sepolia  : clone du mainnet, ETH sans valeur, développement
Local    : Hardhat/Foundry, instantané, pour les tests automatisés
```

> "Workflow pro : développement local → testnet → audit de sécurité → mainnet."

---

## BLOC 5 — Notebook Colab (30 min)
> **Fil rouge :** lire ce qu'on a créé — prouver que les données sont permanentes et lisibles par n'importe qui.
> Phrase d'intro : *"Vous avez déployé un contrat et émis des badges. Maintenant on va les lire — pas depuis Remix, pas depuis la DApp — depuis Python, directement sur le réseau."*

Projeter le lien Colab. Chaque étudiant l'ouvre sur son poste.

```
https://colab.research.google.com/github/Noahxel/SDC-WEB3/blob/main/skillchain_workshop.ipynb
```

### Protocole cellule par cellule

**Cellule 0 — Installation**
> "Lancez cette cellule. Elle installe web3.py — l'équivalent Python d'ethers.js."

**Cellule 1 — Connexion Sepolia**
> "Vous devez voir un numéro de bloc. Ce numéro augmente toutes les 12 secondes — c'est le rythme du réseau Proof of Stake."

**Cellule 2 — Charger le contrat** ← moment clé
> "Remplacez l'adresse par VOTRE adresse de contrat déployé au Bloc 3. Chacun a la sienne."

Laisser 2 minutes pour que chacun copie son adresse depuis Etherscan ou Remix.

**Cellule 3 — Nombre de badges**
> "Combien de badges sur votre contrat ? Comparez avec votre voisin — pas le même chiffre, pas le même contrat."

**Cellule 4 — Lire tous les badges**
> "Vos données. Votre contrat. Lisibles depuis n'importe où dans le monde."

**Cellule 5 — Vérifier une adresse**
> "Entrez votre adresse MetaMask. Vous voyez les badges que vous avez reçus."

**Cellules 6-10** — blocs, transactions, hash, dérivation d'adresse
Laisser avancer en autonomie. Passer dans les rangs pour débloquer.

---

## BLOC 6 — DApp frontend — démo guidée (20 min)
> **Fil rouge :** montrer la boucle complète — une interface web qui écrit et lit sur la blockchain.
> Phrase d'intro : *"On a lu les données depuis Python. Maintenant on voit comment un vrai frontend web3 interagit avec la blockchain — c'est la stack que vous utiliserez dans le Master."*

Projeter le lien StackBlitz sur l'écran.

**Déroulé projeté (instructeur pilote, étudiants suivent) :**

1. Connecter MetaMask → montrer que l'adresse apparaît
2. Émettre un badge : adresse d'un étudiant + `"Web3 Workshop"`
   → MetaMask s'ouvre → confirmer → lien Etherscan généré automatiquement
3. Cliquer le lien Etherscan → montrer la transaction confirmée
4. Vérifier les badges de cet étudiant → ils apparaissent dans la DApp

**Expliquer le code clé (5 min) :**

```javascript
const tx = await contract.issueBadge(student, skill);
// 1. ethers.js encode l'appel en ABI
// 2. MetaMask signe avec votre clé privée
// 3. La transaction est envoyée au nœud Sepolia
// 4. Un validateur l'inclut dans un bloc

await tx.wait();
// Donnée permanente sur la blockchain après ~12 sec
```

5. Rouvrir le Notebook Colab → relancer la cellule 4
   → Le nouveau badge apparaît dans le notebook

> "Boucle complète : écrire via une DApp → transaction sur la blockchain → lisible depuis n'importe quel outil, n'importe où dans le monde."

6. Rouvrir XRPL Visualizer
   > "On a commencé par regarder ce réseau sans comprendre. Maintenant vous savez ce que chaque ligne représente."

---

## BLOC 7 — Présentation de la spécialisation (10 min)

> Contenu propre à l'école (programme, débouchés), non inclus dans ce dépôt.
>
> **Fil rouge :** relier ce qui vient d'être fait au parcours qui suit. *"Ce soir, vous avez fait le bloc 1."*

---

## BLOC 8 — Q&A + clôture (10 min)

Ressources à projeter :

```
Continuer Solidity     cryptozombies.io
Projets guidés         speedrunethereum.com
Docs officielles       docs.soliditylang.org
Outils pro             hardhat.org  |  getfoundry.sh
Notebook du workshop   https://colab.research.google.com/github/Noahxel/SDC-WEB3/blob/main/skillchain_workshop.ipynb
Repo GitHub            https://github.com/Noahxel/SDC-WEB3
```
