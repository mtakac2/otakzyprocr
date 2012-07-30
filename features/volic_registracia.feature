# language: sk

Požiadavka: Registrácia voliča
 
  Pozadie:
    Pokiaľ je zaregistrovaný admin
    A nie je prihlásený

  Scenár: Úspešná registrácia
    Keď sa volič zaregistruje
    Tak je prihlásený do systému
    A vidí správu "Vaše registrace proběhla úspěšne."

  Scenár: Pokus o registráciu s nevalidným mailom
    Keď sa volič pokúsi zaregistrovať a pole "Email" vyplní hodnotou "invalid@email"
    Tak vidí registračný formulár a pole "Email" ma hodnotu "invalid@email"
    A vidí správu "Email musí být ve tvaru email@example.com"

  Scenár: Pokus o registráciu s nekompletnými údajmi
    Keď sa volič pokúsi zaregistrovať a pole "Email" vyplní hodnotou ""
    Tak vidí registračný formulár a pole "Email" ma hodnotu ""
    A vidí správu "Zadejte prosím email"

  Scenár: Registrácia cez Facebook API