class LandmarksController < ApplicationController

  get '/landmarks' do 
    erb :'/landmarks/index'
  end
  
  get '/figures/new' do 
    erb :'/landmarks/new'
  end 
  
  post '/landmarks' do 
    @figure = Figure.create(params[:figure])
    @figure.landmarks << Landmark.create(params[:landmark][:name]) unless params[:landmark][:name].empty?
    @figure.titles << Title.create(params[:title][:name]) unless params[:title][:name].empty?
    @figure.save
    erb :'/landmarks/show'
  end
  
  get '/landmarks/:id' do 
    @figures = Figure.find(params[:id])
    redirect :"/figures/#{@figure.id}"
  end
  
  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    erb :"/figures/edit"
  end
  
  patch '/landmarks/:id' do 
    @figure = Figure.update(params[:figure])
    @figure.landmarks << Landmark.create(params[:landmark][:name]) unless params[:landmark][:name].empty?
    @figure.titles << Title.create(params[:title][:name]) unless params[:title][:name].empty?
    @figure.save
    redirect :"/landmarks/#{@figure.id}"
  end


end
