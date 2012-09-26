#encoding: utf-8

class PaymentsController < ApplicationController
  def paypal
    @citizens_question = session[:citizens_question]
    session[:citizens_question] = nil
    
    """
    if @citizens_question.save
      @status = 'Vaše platba proběhla úspěšne. Doklad o platbě byl zaslán na Váš email. Pro více detailů se múžete přihlásit do svého
        paypal účtu: www.paypal.com/us. Děkujeme.'
    else
      @status = 'Byli zaznamenány problémy s platbou. Prosím kontaktujte administrátora.'
    end
    """    
  end
end