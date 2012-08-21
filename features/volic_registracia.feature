# language: sk

Požiadavka: Registrácia voliča
  Systém umožnuje Voličovi registráciu dvoma spôsobmi
  1. Volič si na úvodnej stránke vyberie jednu z otázok
  2. Volič zvolí možnosť 'Registrovat se' a otázku si vyberie počas registrácie
  V systéme mǒze existovať Volič bez vybratej otázky, ale len s obmedzeným prístupom
 
  Pozadie:
    Pokiaľ existuje Admin

  Scenár: Úspešná registrácia s výberom otázky cez odkaz 'Registrovat se'
    Pokiaľ existuje otázka
    Keď volič vyplní svoje uživateľské registračné údaje
    A volič vyplní svoje osobné registračné údaje
    A volič si pri registrácii vyberie otázku
    Tak vidí správu "Vítejte. Vaše registrace proběhla úspěšne."
    A vidí správu "Váš účet aktivovat."
    A nevidí odkaz "Odhlásit se"
    A nevidí odkaz "Spravovat účet"
    Ale vidí odkaz "Přihlásit se"
    A "user@mail.com" by mal dostať email
    Keď Volič otvorí email "user@mail.com"
    A klikne na emailový odkaz "Aktivovat účet"
    Tak vidí správu "Váš účet byl úspěšne aktivován."
    A vidí odkaz "Odhlásit se"
    A vidí odkaz "Správa účtu"
    A nevidí odkaz "Registrovat se"
    A nevidí odkaz "Přihlásit se"

  Scenár: Úspešná registrácia bez výberu otázky cez odkaz 'Registrovat se'
    Keď volič vyplní svoje uživateľské registračné údaje
    A volič vyplní svoje osobné registračné údaje
    A volič si pri registrácii nevyberie otázku
    Tak vidí správu "Vítejte. Vaše registrace proběhla úspěšne."
    A vidí správu "Váš účet aktivovat."
    A nevidí odkaz "Odhlásit se"
    A nevidí odkaz "Spravovat účet"
    Ale vidí odkaz "Přihlásit se"
    A "user@mail.com" by mal dostať email
    Keď Volič otvorí email "user@mail.com"
    A klikne na emailový odkaz "Aktivovat účet"
    Tak vidí správu "Váš účet byl úspěšne aktivován."
    A vidí odkaz "Odhlásit se"
    A vidí odkaz "Správa účtu"
    A nevidí odkaz "Registrovat se"
    A nevidí odkaz "Přihlásit se"    

  Scenár: Pokus o registráciu s nevalidným mailom
    Keď sa volič pokúsi zaregistrovať a pole "Email" vyplní hodnotou "invalid@email"
    Tak vidí registračný formulár a pole "Email" ma hodnotu "invalid@email"
    A vidí správu "Formulář byl vyplněn chybně. Opravte prosím následujíci chyby:"
    A vidí správu "musí být ve tvaru email@example.com"

  Scenár: Pokus o registráciu s emailom, ktorý už v databáze voličov existuje
    Pokiaľ existuje volič s emailom "obsadeny@volic.com"
    Keď sa volič pokúsi zaregistrovať a pole "Email" vyplní hodnotou "obsadeny@volic.com"    
    Tak vidí registračný formulár a pole "Email" ma hodnotu "obsadeny@volic.com"
    A vidí správu "Formulář byl vyplněn chybně. Opravte prosím následujíci chyby:"  
    A vidí správu "uživatel se zadaným emailem už existuje"

  Scenár: Pokus o registráciu s emailom, ktorý už v databáze politikov existuje
    Pokiaľ existuje politik s emailom "obsadeny@politik.com"
    Keď sa volič pokúsi zaregistrovať a pole "Email" vyplní hodnotou "obsadeny@politik.com"
    Tak vidí registračný formulár a pole "Email" ma hodnotu "obsadeny@politik.com"
    Tak vidí správu "Formulář byl vyplněn chybně. Opravte prosím následujíci chyby:"  
    A vidí správu "uživatel se zadaným emailem už existuje"

  Scenár: Pokus o registráciu s heslom kratším ako 6 znakov
    Pokiaľ je uživateľ na domovskej stránke
    A klikne na odkaz "Registrovat se"
    A pole "Heslo" vyplní hodnotou "12345"
    A pole "Potvrzení hesla" vyplní hodnotou "12345"
    A klikne na tlačítko "Pokračovat"
    Tak vidí správu "Formulář byl vyplněn chybně. Opravte prosím následujíci chyby:"  
    A vidí správu "musí být alespoň 6 znaků dlouhé"

  Scenár: Pokus o registráciu s heslom, ktoré sa nezhoduje s potvrdením
    Keď sa volič pokúsi zaregistrovať a pole "Heslo" vyplní hodnotou "123456"    
    Tak vidí správu "Formulář byl vyplněn chybně. Opravte prosím následujíci chyby:"  
    A vidí správu "doesn't match confirmation"

  Scenár: Pokus o registráciu bez vybratia okresu a pohlavia
    Keď volič vyplní svoje uživateľské registračné údaje
    A volič vyplní svoje osobné registračné údaje bez okresu a pohlavia
    Tak vidí správu "Formulář byl vyplněn chybně. Opravte prosím následujíci chyby:"  
    A vidí správu "je povinný"
    A vidí správu "výběr pohlaví je povinný"

  Scenár: Registrácia cez Facebook API
    # TODO