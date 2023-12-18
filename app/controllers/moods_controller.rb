class MoodsController < ApplicationController
    before_action :set_mood, only: [:show, :edit, :update, :destroy]
  
    def index
      @moods = Mood.all
    end
  
    def show
     @mood = Mood.find(params[:id])
    end
  
    def new
      @mood = Mood.new
    end
  
    def create
      @mood = Mood.new(mood_params)

      if @mood.save
        redirect_to mood_path(@mood), notice:'Mood was successfully created'
        # render turbo_stream: turbo_stream.append('your-frame-id', partial: 'your_form_partial', locals: { mood: @mood })
      else
        puts "Failed to save mood!"
        puts @mood.errors.full_messages
        render :new
      end
    end
   
    def add_articles_to_mood 
      mood = Mood.update!(articles: article_url)
    end 

    def edit
      @mood = Mood.find(params[:id])
    end
  
    def update
      if @mood.update(mood_params)
        redirect_to @mood, notice: 'Mood was successfully updated.'
      else
        puts "Failed to update mood!"
        puts @mood.errors.full_messages
        render :edit
      end
    end
  
    def destroy
      @mood.destroy
      redirect_to moods_url, notice: 'Mood was successfully destroyed.'
    end
  
    private
  
    def set_mood
      @mood = Mood.find(params[:id])
    end
  
    def mood_params
      params.require(:mood).permit(:phrase, :articles, :dateSearched, :user_id, :journal_id)
    end
    
  end
  