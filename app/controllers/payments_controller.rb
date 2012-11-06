#encoding: utf-8

class PaymentsController < ApplicationController
  def paypal
    
    @citizens_question = CitizensQuestion.new(citizen_id: session[:c_q_citizen_id], question_id: session[:c_q_question_id],
      hours: session[:c_q_hours])
    session[:c_q_citizen_id] = nil
    session[:c_q_question_id] = nil
    session[:c_q_hours] = nil
        
    if @citizens_question.save
      if @citizens_question.hours <= 10
        @total = 50
      else
        @total = @citizens_question.hours * 5
      end

      Payment.create(hours: @citizens_question.hours, total: @total)
      @status = 'Vaše platba proběhla úspěšne. Doklad o platbě byl zaslán na Váš email. Pro více detailů se múžete přihlásit do svého
        paypal účtu: www.paypal.com/us. Děkujeme.'
    else
      @status = 'Byly zaznamenány problémy s platbou. Prosím kontaktujte administrátora.'
    end
  end
end