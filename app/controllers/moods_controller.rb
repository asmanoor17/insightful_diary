class MoodsController < ApplicationController
    before_action :set_mood, only: [:show, :edit, :update, :destroy]
  
    def index
      @moods = Mood.all
    end
  
    def show
      # Your show action logic here
    end
  
    def new
      # Your new action logic here
      @mood = Mood.new
    end
  
    def create
      # Your create action logic here
      @mood = Mood.new(mood_params)
  
      if @mood.save
        redirect_to @mood, notice: 'Mood was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      # Your edit action logic here
    end
  
    def update
      # Your update action logic here
      if @mood.update(mood_params)
        redirect_to @mood, notice: 'Mood was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      # Your destroy action logic here
      @mood.destroy
      redirect_to moods_url, notice: 'Mood was successfully destroyed.'
    end
  
    private
  
    def set_mood
      @mood = Mood.find(params[:id])
    end
  
    def mood_params
      params.require(:mood).permit(:phrase, :article, :dateSearched)
    end
  end
  