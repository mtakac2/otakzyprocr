# language: sk

Požiadavka: Vytvorenie otazky
  Systém umožňuje správcovi politických subjektov vytvoriť otázku pre ním spravovaný subjekt
 
  Pozadie:
    Pokiaľ existuje Admin
    A existuju volby
    A existuje Správca politických subjektov
    A Správca je prihlásený do systému

  @javascript
  Scenár: Úspešné otázky
    Keď je Správca na stránke so správou svojho účtu
    A klikne na odkaz "Přidat otázku"
    A vyplní údaje záhlavie a telo otázky    
    A klikne na tlačítko "Přidat"
    Tak vidí správu "Vaše otázka byla úspěšne přidaná."
    A nachádza sa na stránke so správou svojho účtu    