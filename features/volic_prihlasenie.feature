# language: sk

Požiadavka: Prihlásenie sa voliča
 
  Pozadie:
    Pokiaľ je zaregistrovaný admin
    A nie je prihlásený

  Scenár: Úspešný login
    Keď sa volič prihlási do systému
    Tak vidí odkaz "Odhlásit se"
    A vidí odkaz "Správa účtu"
    A nevidí odkaz "Registrovat se"
    A nevidí odkaz "Přihlásit se"

  Scenár: Pokus o login nezaregistrovaného voliča
    Keď sa pokúsi prihlásiť nezaregistrovaný volič
    Tak vidí správu "Zadali ste nesprávný email nebo heslo. Nemáte ještě svůj účet? Zaregistrujte se. Nebo ste jen zapomneli své heslo?"

  Scenár: Prihlásenie sa cez Facebook API
    # TODO