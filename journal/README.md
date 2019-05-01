# Notre journal de bord

## 28 mars

Composition de l’équipe et reflexion sur le type de jeu.

## 30 mars

Décidé sur un jeu de platforme, nous avons commencé notre premier prototype de jeu sans aucune base sur la language lua et sur le logiciel pico-8. Ce ![tutoriel](https://youtu.be/q6c6DvGK4lg) fut donc très utile. On a très vite compris qu’il serait compliqué de coder via l’interface de pico-8. Nous avons donc choisis d’utiliser *Pico-8 VSCode Plugin* pour coder le jeu via *Visual Studio Code*, d'autant plus que nous sommes déjà familier avec cette editeur.

## 31 mars

Ca y est, nous sommes déjà accro ! on enchaine très vite les lignes de code et les push.

## 8 avril

On utilise plusieurs sprite pour l’animation de notre héros, des sprite de 1 en largeur et 2 en hauteur. On réalise qu’il serait plus intelligent de recycler les sprites identiques de notre héros, comme par exemple en deux:
![sprites](https://image.noelshack.com/fichiers/2019/18/3/1556709869-sprites.png)

Cela implique de faire une refonte du moteur de jeu (gestion des collisions, lancement des projectils, animation du heros, physique du personnage avec la map...). Etant donné le peu de temps qu’il nous reste et la charge de travail que nous avons en dehors du projet, nous avons du mettre cette optimisation de sprite de côté.

## 16 avril

On se rend vite compte de la limite en taille qu’impose pico-8. En cherchant un peu sur le forum du site ![lexaloffle](https://www.lexaloffle.com), on découvre une méthode pour compresser les images que nous avons insérer en tant que “code”. Après l’avoir bien modifié à notre sauce (voir annexe), on se rend compte qu’elle nous fait gagner quelques tokens mais rend la compression en png plus lourde et est donc unitilisable. On supprime donc quelques une de nos images et appliquons d’autres méthodes d’optimisations afin de continuer/finir le jeu.

## 19 avril

Nous butons sur l’approche à adopter pour l’intégration d’un boss final, nous avons fait un 1er prototype:   
![prototype](https://image.noelshack.com/fichiers/2019/18/3/1556709869-prototypeboss.png)

mais il nous manquait quelques sprites pour l’animer. Après quelques optimisation (recyclage de sprite via rotation, remaplacement de sprite par des rectfill() ) Nous avons pu gagner quelques sprites et les utiliser pour finaliser le jeu.

## Annexe

![annexe](https://image.noelshack.com/fichiers/2019/18/3/1556709870-code.png)