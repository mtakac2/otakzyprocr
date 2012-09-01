# language: sk

Požiadavka: Vytvorenie správcu
  Systém umožňuje administrátorovi vytvorenie Správcu politika alebo strany
 
  Pozadie:
    Pokiaľ existuje Admin    
    A existuju volby
    A Admin je prihlásený do systému

  @javascript
  Scenár: Úspešné vytvorenie Správcu pre politika
    Keď Admin navštívi cestu "/refinery/keepers/new/"
    A vyplní prihlasovacie údaje Správcu
    A vyplní osobné údaje Správcu
    A klikne na odkaz "Add politician"
    A vyplní údaje Politika
    A klikne na tlačítko "Save"
    Tak vidí správu o úspešnom pridaní Správcu
    A vidí zoznam všetkých Správcov
    A "keeper@email.com" by mal dostať email
    Keď Správca otvorí email "keeper@email.com"
    A klikne na emailový odkaz "Aktivovat účet"
    Tak vidí správu "Váš účet byl úspěšne aktivován."
    A vidí odkaz "Odhlásit se"
    A vidí odkaz "Správa účtu"
    A nevidí odkaz "Registrovat se"
    A nevidí odkaz "Přihlásit se"