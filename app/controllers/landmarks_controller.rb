class LandmarksController < ApplicationController

  get '/figures' do 
    erb :'/figures/index'
  end
  
  get '/figures/new' do 
    erb :'/figures/new'
  end 
  
  post '/figures' do 
    @figure = Figure.create(params[:figure])
    @figure.landmarks << Landmark.create(params[:landmark][:name]) unless params[:landmark][:name].empty?
    @figure.titles << Title.create(params[:title][:name]) unless params[:title][:name].empty?
    @figure.save
    erb :'/figures/show'
  end
  
  get '/figures/:id' do 
    @figures = Figure.find(params[:id])
    redirect :"/figures/#{@figure.id}"
  end
  
  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    erb :"/figures/edit"
  end
  
  patch '/figures/:id' do 
    @figure = Figure.update(params[:figure])
    @figure.landmarks << Landmark.create(params[:landmark][:name]) unless params[:landmark][:name].empty?
    @figure.titles << Title.create(params[:title][:name]) unless params[:title][:name].empty?
    @figure.save
    redirect :"/figures/#{@figure.id}"
  end


end
