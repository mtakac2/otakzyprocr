# encoding: UTF-8

class CitizensController < ApplicationController
  def show
    @citizen = Refinery::Citizens::Citizen.find(current_user)
  end

  def new
    @elections = Refinery::Elections::Election.order(:held)
    @questions = Refinery::Questions::Question.order(:name)
    @counties = Refinery::Counties::County.order(:name)
    @years = [13]
    86.times do
      @years << @years.last + 1
    end
    session[:citizen_params] ||= {}
    @citizen = Refinery::Citizens::Citizen.new(session[:citizen_params])
    @citizen.current_step = session[:citizen_step]
  end

  def create    
    @elections = Refinery::Elections::Election.order(:held)    
    @counties = Refinery::Counties::County.order(:name)
    @years = [13]
    86.times do
      @years << @years.last + 1
    end
    session[:citizen_params].deep_merge!(params[:citizen]) if params[:citizen]
    @citizen = Refinery::Citizens::Citizen.new(session[:citizen_params])
    @citizen.current_step = session[:citizen_step]

    if @citizen.valid?
      if @citizen.last_step?
        if @citizen.all_valid?
          @citizen.save
          @question = Refinery::Questions::Question.find(params[:question_id])
          @citizens_question = CitizensQuestion.new
          @citizens_question.citizen_id = @citizen.id
          @citizens_question.question_id = @question.id
          @citizens_question.save
        end        
      else
        @citizen.next_step
      end

      session[:citizen_step] = @citizen.current_step
    end

    if @citizen.new_record?
      render 'new'
    else
      session[:citizen_step] = session[:citizen_params] = nil
      CitizensMailer.registration(@citizen).deliver
      redirect_to '/', :flash => { :success => 'Vítejte. Vaše registrace proběhla úspěšne. Dekujeme za Váš zájem. Na Vaši 
        emailovou adresu byla odoslána správa. Pomocí odkazu v ní si můžete Váš účet aktivovat.' }
    end
  end

  def edit
    @counties = Refinery::Counties::County.order(:name)
    @years = [13]
    86.times do
      @years << @years.last + 1
    end
    @citizen = Refinery::Citizens::Citizen.find(params[:id])
  end

  def update
    @counties = Refinery::Counties::County.order(:name)
    @years = [13]
    86.times do
      @years << @years.last + 1
    end
    @citizen = Refinery::Citizens::Citizen.find(params[:id])

    @citizen.next_step

    if @citizen.update_attributes(params[:citizen])
      redirect_to main_app.citizen_path(@citizen), :flash => { :success => 'Váš účet byl úspěšne upraven.' }
    else
      render 'edit'
    end
  end

  def activate    
    @citizen = Refinery::Citizens::Citizen.find_by_activation_code(params[:activation_code])

    if @citizen.nil?
      redirect_to '/'
    end    
    
    @citizen.next_step
    @citizen.next_step

    if @citizen.update_attributes(:activation_code => nil)
      session[:user_id] = @citizen.id
      session[:user_type] = @citizen.class.name
      redirect_to '/', :notice => 'Váš účet byl úspěšne aktivován. Prosím vyberte si otázku.'      
    end    
  end
end