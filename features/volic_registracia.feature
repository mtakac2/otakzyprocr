# language: sk

Požiadavka: Registrácia voliča
  Systém umožnuje Voličovi registráciu dvoma spôsobmi
  1. Volič si na úvodnej stránke vyberie jednu z otázok
  2. Volič zvolí možnosť 'Registrovat se' a otázku si vyberie počas registrácie
  V systéme mǒze existovať Volič bez vybratej otázky, ale len s obmedzeným prístupom
 
  Pozadie:
    Pokiaľ existuje Admin

  Scenár: Úspešná registrácia s výberom otázky cez odkaz 'Registrovat se'
    Pokiaľ existuje otazka
    Keď volič vyplní svoje uživateľské registračné údaje
    A volič vyplní svoje osobné registračné údaje
    A volič si pri registrácii vyberie otázku
    A "user@mail.com" by mal dostať email
    Tak je prihlásený do systému
    A vidí správu "Vaše registrace proběhla úspěšne."

  Scenár: Pokus o registráciu s nevalidným mailom
    Keď sa volič pokúsi zaregistrovať a pole "Email" vyplní hodnotou "invalid@email"
    Tak vidí registračný formulár a pole "Email" ma hodnotu "invalid@email"
    A vidí správu "Formulář byl vyplněn chybně. Opravte prosím následujíci chyby:"
    A vidí správu "musí být ve tvaru email@example.com"

  Scenár: Pokus o registráciu s emailom, ktorý už v databáze voličov existuje
    Pokiaľ v systéme už existuje účet voliča s emailom "obsadeny@volic.com"
    Keď sa volič pokúsi zaregistrovať a pole "Email" vyplní hodnotou "obsadeny@volic.com"    
    Tak vidí správu "Formulář byl vyplněn chybně. Opravte prosím následujíci chyby:"  
    A vidí správu "uživatel se zadaným emailem už existuje"

  Scenár: Pokus o registráciu s emailom, ktorý už v databáze politikov existuje
    Pokiaľ v systéme už existuje účet politika s emailom "obsadeny@politik.com"
    Keď sa volič pokúsi zaregistrovať a pole "Email" vyplní hodnotou "obsadeny@politik.com"    
    Tak vidí správu "Formulář byl vyplněn chybně. Opravte prosím následujíci chyby:"  
    A vidí správu "uživatel se zadaným emailem už existuje"

  Scenár: Pokus o registráciu s heslom kratším ako 6 znakov
    Keď sa volič pokúsi zaregistrovať a pole "Heslo" vyplní hodnotou "12345"    
    Tak vidí správu "Formulář byl vyplněn chybně. Opravte prosím následujíci chyby:"  
    A vidí správu "musí být alespoň 6 znaků dlouhé"

  Scenár: Pokus o registráciu s heslom, ktoré sa nezhoduje s potvrdením
    Keď sa volič pokúsi zaregistrovať a pole "Heslo" vyplní hodnotou "123456"    
    Tak vidí správu "Formulář byl vyplněn chybně. Opravte prosím následujíci chyby:"  
    A vidí správu "doesn't match confirmation"

  Scenár: Pokus o registráciu bez vybratia okresu a pohlavia
    Keď sa volič pokúsi zaregistrovať bez výberu okresu a pohlavia
    Tak vidí správu "Formulář byl vyplněn chybně. Opravte prosím následujíci chyby:"  
    A vidí správu "je povinný"
    A vidí správu "výběr pohlaví je povinný"

  Scenár: Registrácia cez Facebook API
    # TODO