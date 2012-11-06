# encoding: UTF-8

class CitizensController < ApplicationController    
  before_filter :authorized_user_access?, only: [:show, :edit]
  before_filter :redirect_logged_in_user, only: :new

  def show     
    @citizen = Refinery::Citizens::Citizen.find(params[:id])
  end

  def new        
    @counties = Refinery::Counties::County.order(:name)
    @years = 13 .. 99
    session[:citizen_params] ||= {}
    @citizen = Refinery::Citizens::Citizen.new(session[:citizen_params])
    @citizen.current_step = session[:citizen_step]
  end

  def create    
    # @elections = Refinery::Elections::Election.order(:held)        
    @counties = Refinery::Counties::County.order(:name)
    @years = 13 .. 99

    session[:citizen_params].deep_merge!(params[:citizen]) if params[:citizen]
    @citizen = Refinery::Citizens::Citizen.new(session[:citizen_params])
    @citizen.current_step = session[:citizen_step]

    if @citizen.valid?
      if @citizen.last_step?
        if @citizen.all_valid?
          @citizen.save          
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
      CitizensMailer.registration(@citizen, @question).deliver
      redirect_to '/', :flash => { :success => 'Vítejte. Vaše registrace proběhla úspěšně. Děkujeme za Váš zájem. Na Vaši emailovou adresu byla odeslána zpráva. Pomocí odkazu v ní si můžete Váš účet aktivovat.' }
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
      redirect_to main_app.citizen_path(@citizen), :flash => { :success => 'Váš účet byl úspěšně upraven.' }
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

    if @citizen.update_attributes(:activation_code => nil)
      session[:user_id] = @citizen.id
      session[:user_type] = @citizen.class.name
      if session[:return_url]
          return_url = session[:return_url]
          session[:return_url] = nil
          redirect_to return_url, :flash => { :success => 'Váš účet byl úspěšně aktivován.' }
      else
        redirect_to questions_path, :flash => { :success => 'Váš účet byl úspěšně aktivován. Vyberte si prosím otázku, na které budete pracovat.' }
      end
    end    
  end

  def mark_question_as_solved    
    @citizen = Refinery::Citizens::Citizen.find(params[:citizen_id])
    @question = Refinery::Questions::Question.find(params[:question_id])
    if @question.update_attributes(done: true)    
      redirect_to @citizen, flash: { success: 'Otázka byla označená za vyřešenou.' }
    else
      render 'show'
    end
  end
end