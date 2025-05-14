# Používateľská príručka k aplikácii

Táto príručka popisuje, ako používať webovú aplikáciu na správu fyzioterapeutických plánov. Je určená pre dve hlavné skupiny používateľov: **fyzioterapeuti** a **klienti**.

Aplikácia je dostupná na linku: <a href="https://physioflow-efc5e7175d2c.herokuapp.com/sk/users/sign_in" target="_blank">PhysioFlow</a>

## Obsah

[1. Fyzioterapeut](#1-fyzioterapeut)

- [1.1 Registrácia a prihlásenie](#11-registrácia-a-prihlásenie)
- [1.2 Vytvorenie cvičenia](#12-vytvorenie-cvičenia)
- [1.3 Vytvorenie plánu](#13-vytvorenie-plánu)
- [1.4 Priradenie plánu klientovi](#14-priradenie-plánu-klientovi)
- [1.5 Pridanie nového klienta](#15-pridanie-nového-klienta)
- [1.6 Komunikácia s klientom](#16-komunikácia-s-klientom)
- [1.7 Nastavenie dostupných termínov](#17-nastavenie-dostupných-termínov)
- [1.8 Prehľad nadchádzajúcich stretnutí](#18-prehľad-nadchádzajúcich-stretnutí)

[2. Klient](#2-klient)

- [2.1 Prihlásenie po pozvánke](#21-prihlásenie-po-pozvánke)
- [2.2 Prehľad priradených plánov](#22-prehľad-priradených-plánov)
- [2.3 Označenie splnených cvičení](#23-označenie-splnených-cvičení)
- [2.4 Rezervácia termínu](#24-rezervácia-termínu)
- [2.5 Komunikácia](#25-komunikácia)
- [2.6 Prehľad stretnutí](#26-prehľad-stretnutí)

---

## 1. Fyzioterapeut

### 1.1 Registrácia a prihlásenie

Fyzioterapeut sa registruje pomocou formulára na hlavnej stránke.
![Prihlásenie do systému](img/f_register.png)

Po registrácii je možné sa prihlásiť pomocou e-mailu a hesla. Po prihlásení sa dostaneme na hlavnu stránku aplikácie.

> Ak nechcete vytvárať nového používateľa, môžete sa prihlásiť pomocou nasledujúcich údajov:

| E-mail               | Heslo    |
| -------------------- | -------- |
| `admin1@example.com` | `123123` |

![Prihlásenie do systému](img/f_dashboard.png)

### 1.2 Vytvorenie cvičenia

Fyzioterapeut sa k vytvoreniu cvičenia vie dostať dvoma spôsobmi:

- z hlavného menu kliknutím na položku **Exercises**,
- cez **rýchlu akciu** na dashboarde kliknutím na tlačidlo **New Exercise**, ktoré ho presmeruje priamo do formulára na vytvorenie cvičenia.

![Vytvorenie cvicenia](img/f_exercise1.png)

V sekcii **Exercises** sa nachádza zoznam vytvorených cvičení, s ktorými môže používateľ vykonávať nasledovné akcie:

- **New Exercise** – otvorí formulár pre vytvorenie nového cvičenia,
- kliknutím na **názov cvičenia** sa otvorí jeho detail,
- ✏️ – otvorí formulár pre úpravu existujúceho cvičenia,
- 🗑️ – odstráni cvičenie z databázy.

![Vytvorenie cvicenia](img/f_exercise2.png)

Pri vytváraní cvičenia si môže používateľ zvoliť jazyk, v ktorom bude cvičenie vytvorené. Je potrebné vyplniť povinné polia ako **názov**, **popis**, **počet sérií** a **počet opakovaní**. Voliteľne je možné pridať jeden alebo viac obrázkov a odkaz na video.
![Vytvorenie cvicenia](img/f_exercise3.png)

Po úspešnom uložení sa zobrazí náhľad vytvoreného cvičenia.
![Vytvorenie cvicenia](img/f_exercise4.png)

### 1.3 Vytvorenie plánu

### 1.4 Priradenie plánu klientovi

### 1.5 Pridanie nového klienta

V menu kliknete na sekciu **Clients** a po kliknutí na **New Client** sa otvorí formulár pre pridanie nového klienta.

![Pridanie noveho klienta](img/f_client1.png)

Zadajte meno, e-mail a systém automaticky odošle pozvánku na registráciu.

> 🔔 **Upozornenie:** Klient by si mal skontrolovať aj priečinok **Spam**

Po kliknutí na sekciu **Clients** si fyzioterapeut môže prezrieť podrobnosti o konkrétnom klientovi vrátane jeho údajov a priradených plánov (ak už nejaké má).
![Pridanie noveho klienta](img/f_client2.png)

Ak klient ešte neprijal pozvánku, táto informácia sa zobrazí priamo v jeho profile. Fyzioterapeut tak vie jednoducho skontrolovať, či sa klient zaregistroval a má prístup do systému.

### 1.6 Komunikácia s klientom

### 1.7 Nastavenie dostupných termínov

Fyzioterapeut môže v sekcii **My Availability** vytvárať termíny, ktoré budú dostupné na rezerváciu jeho klientom.

Po kliknutí na tlačidlo **New Session** sa otvorí formulár, v ktorom fyzioterapeut vyplní nasledujúce údaje:

- **Name** – názov stretnutia (napr. _Online consultation – posture check_),
- **Location** – miesto stretnutia (napr. _Google Meet_, _Physio Clinic Bratislava_),
- **Description** – stručný popis stretnutia,
- **Duration** – dĺžka trvania stretnutia v minútach,
- **Date and Time** – dátum a čas stretnutia.

![Pridanie noveho klienta](img/f_sessions.png)
Po uložení sa termín zobrazí v zozname dostupných stretnutí. Klienti si následne môžu tieto termíny rezervovať vo svojej časti aplikácie. Každý termín môže byť rezervovaný len jedným klientom.

### 1.8 Prehľad nadchádzajúcich stretnutí

---

## 2. Klient

### 2.1 Prihlásenie po pozvánke

### 2.2 Prehľad priradených plánov

### 2.3 Označenie splnených cvičení

### 2.4 Rezervácia termínu

### 2.5 Komunikácia

### 2.6 Prehľad stretnutí

---
