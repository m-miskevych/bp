# Používateľská príručka k aplikácii

Táto príručka popisuje, ako používať webovú aplikáciu na správu cvičebných plánov. Je určená pre dve hlavné skupiny používateľov: **fyzioterapeuti** a **klienti**.

Aplikácia je dostupná na linku: <a href="https://physioflow-efc5e7175d2c.herokuapp.com/sk/users/sign_in" target="_blank">PhysioFlow</a>

## Obsah

[1. Fyzioterapeut](#1-fyzioterapeut)

- [1.1 Registrácia a prihlásenie](#11-registrácia-a-prihlásenie)
- [1.2 Vytvorenie cvičenia](#12-vytvorenie-cvičenia)
- [1.3 Vytvorenie plánu](#13-vytvorenie-plánu)
- [1.4 Priradenie plánu klientovi](#14-priradenie-plánu-klientovi)
- [1.5 Komunikácia s klientom](#15-komunikácia-s-klientom)
- [1.6 Nastavenie dostupných termínov](#16-nastavenie-dostupných-termínov)
- [1.7 Prehľad nadchádzajúcich stretnutí](#17-prehľad-nadchádzajúcich-stretnutí)

[2. Klient](#2-klient)

- [2.1 Prihlásenie po pozvánke](#21-prihlásenie-po-pozvánke)
- [2.2 Prehľad priradených plánov](#22-prehľad-priradených-plánov)
- [2.3 Rezervácia termínu](#23-rezervácia-termínu)

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
| `admin2@example.com` | `123123` |

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

### 1.3 Vytvorenie plánu a priradenie plánu

Fyzioterapeut môže vytvoriť nový plán cez sekciu **Plans** kliknutím na vizuálne tlačidlo **+**.

![Vytvorenie plánu](img/f_plan1.png)
![Vytvorenie plánu](img/f_plan2.png)

Podobne ako pri vytváraní cvičenia je možné zvoliť jazyk plánu – buď **slovenčinu** alebo **angličtinu**. Po uložení sa plán zobrazí v zozname všetkých plánov pod záložkou **All**.

Ak chceme plán priradiť konkrétnemu klientovi, klikneme na ikonu 👤 a zo zoznamu vyberieme požadovaného klienta.

![Vytvorenie plánu](img/f_plan3.png)

Pre lepšiu prehľadnosť je možné zobraziť zoznam plánov aj podľa jednotlivých klientov – kliknutím na záložku **By client**.

![Vytvorenie plánu](img/f_plan4.png)

### 1.4 Pridanie nového klienta

V menu kliknete na sekciu **Clients** a po kliknutí na **New Client** sa otvorí formulár pre pridanie nového klienta.

![Clients](img/f_client1.png)

Zadajte meno, e-mail a systém automaticky odošle pozvánku na registráciu.

> 🔔 **Upozornenie:** Klient by si mal skontrolovať aj priečinok **Spam**

Po kliknutí na sekciu **Clients** si fyzioterapeut môže prezrieť podrobnosti o konkrétnom klientovi vrátane jeho údajov a priradených plánov (ak už nejaké má).

![Clients](img/f_client2.png)

Ak klient ešte neprijal pozvánku, táto informácia sa zobrazí priamo v jeho profile. Fyzioterapeut tak vie jednoducho skontrolovať, či sa klient zaregistroval a má prístup do systému.

### 1.5 Komunikácia s klientom

Ku každému plánu má fyzioterapeut aj klient prístup k diskusii, kde môžu navzájom komunikovať.

![Communication](img/f_comment1.png)

### 1.6 Nastavenie dostupných termínov

Fyzioterapeut môže v sekcii **My Availability** vytvárať termíny, ktoré budú dostupné na rezerváciu jeho klientom.

Po kliknutí na tlačidlo **New Session** sa otvorí formulár, v ktorom fyzioterapeut vyplní nasledujúce údaje:

- **Name** – názov stretnutia (napr. _Online consultation – posture check_),
- **Location** – miesto stretnutia (napr. _Google Meet_, _Physio Clinic Bratislava_),
- **Description** – stručný popis stretnutia,
- **Duration** – dĺžka trvania stretnutia v minútach,
- **Date and Time** – dátum a čas stretnutia.

![Sessions](img/f_sessions.png)

Po uložení sa termín zobrazí v zozname dostupných stretnutí. Klienti si následne môžu tieto termíny rezervovať vo svojej časti aplikácie. Každý termín môže byť rezervovaný len jedným klientom.

### 1.7 Prehľad nadchádzajúcich stretnutí

Fyzioterapeut má možnosť zobraziť všetky nadchádzajúce stretnutia so svojimi klientmi v sekcii **Appointments**. Po kliknutí na túto sekciu sa zobrazí zoznam všetkých termínov, ktoré si klienti rezervovali.

Pri každom termíne sú uvedené všetky dôležité informácie – meno klienta, dátum a čas stretnutia, miesto a typ stretnutia (napr. osobne alebo online). Fyzioterapeut má možnosť stretnutie buď potvrdiť, alebo zamietnuť. Po potvrdení stretnutia systém automaticky odošle klientovi e-mailové upozornenie s detailmi termínu.

![Appointments](img/f_app1.png)

---

## 2. Klient

### 2.1 Prihlásenie po pozvánke

Klient dostane pozvánku na registráciu e-mailom. Po kliknutí na odkaz si nastaví heslo a prihlási sa do systému.

![Prijatie pozvanky](img/c_login1.png)

Po prihlásení sa zobrazí hlavná stránka aplikácie (dashboard), kde klient vidí:

- priradené cvičebné plány,
- nadchádzajúce stretnutia (ak má nejaké rezervované).

![Dashboard](img/c_dashboard.png)

> Ak nechcete vytvárať nového používateľa, môžete sa prihlásiť pomocou nasledujúcich údajov:

| E-mail                | Heslo    |
| --------------------- | -------- |
| `client1@example.com` | `123123` |
| `client2@example.com` | `123123` |

### 2.2 Prehľad priradených plánov

Po prekliku do sekcie **Plans** vidí klient zoznam všetkých svojich plánov, rozdelených podľa ich stavu:

- **Draft** – plán ešte nebol začatý,
- **In progress** – plán je aktívny a cvičí sa,
- **Done** – plán bol dokončený.

![Plans](img/c_plan1.png)

V konkrétnom pláne si klient môže prechádzať jednotlivé cvičenia. Pri každom cvičení sú uvedené:

- názov a popis,
- počet sérií a opakovaní,
- prípadne priradené obrázky alebo video (ak ich fyzioterapeut doplnil).

![Plan](img/c_plan2.png)

Po absolvovaní celého plánu si klient môže označiť plán ako **dokončený**.

### 2.3 Rezervácia termínu

Klient si môže rezervovať stretnutie so svojím fyzioterapeutom cez sekciu **Sessions**, kde sa zobrazujú všetky dostupné termíny. Každý záznam obsahuje informácie o:

- názve stretnutia,
- mieste konania (napr. Google Meet alebo ambulancia),
- dátume a čase,
- dĺžke trvania,
- stručnom popise.

![Appointments](img/c_app1.png)

Na rezerváciu termínu stačí kliknúť na tlačidlo **Book** pri vybranom stretnutí. Voliteľne môže pridať aj poznámku pre fyzioterapeuta. Po kontrole údajov klikne na **Confirm Booking**.

![Appointments](img/c_app2.png)

Po potvrdení sa stretnutie zobrazí v sekcii **Appointments** medzi nadchádzajúcimi termínmi. Stretnutie je možné aj zrušiť kliknutím na **Cancel Appointment**.

![Appointments](img/c_app3.png)

---

