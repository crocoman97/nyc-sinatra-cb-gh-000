class LandmarksController < ApplicationController

  get '/landmarks' do 
    erb :'/landmarks/index'
  end
  
  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end 
  
  post '/landmarks' do 
    @landmark = Landmark.update(params[:landmark])
    @landmark.figure = Figure.create(params[:figure_name_2]) unless params[:figure_name_2].empty?
    @landmark.titles << Title.create(params[:title][:name]) unless params[:title][:name].empty?
    @figure.save
    redirect :"/landmarks/#{@landmark.id}"
  end
  
  get '/landmarks/:id' do 
    @figures = Figure.find(params[:id])
    erb :"/landmarks/show"
  end
  
  get '/landmarks/:id/edit' do 
    @figure = Figure.find(params[:id])
    erb :"/landmarks/edit"
  end
  
  patch '/landmarks/:id' do 
    @figure = Figure.update(params[:figure])
    @figure.landmarks << Landmark.create(params[:landmark][:name]) unless params[:landmark][:name].empty?
    @figure.titles << Title.create(params[:title][:name]) unless params[:title][:name].empty?
    @figure.save
    redirect :"/landmarks/#{@figure.id}"
  end


end
