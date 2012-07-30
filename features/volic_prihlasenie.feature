# language: sk

Požiadavka: Prihlásenie sa voliča
 
  Pozadie:
    Pokiaľ je zaregistrovaný admin
    A nie je prihlásený

  Scenár: Úspešný login
    Keď sa volič prihlási do systému
    Tak vidí odkaz "Odhlásit se"
    A nevidí odkaz "Registrovat se"
    A nevidí odkaz "Přihlásit se"

  Scenár: Pokus o login nezaregistrovaného voliča
    Keď sa pokúsi prihlásiť nezaregistrovaný volič
    Tak vidí správu "Zadali ste nesprávný email alebo heslo"

  Scenár: Prihlásenie sa cez Facebook API