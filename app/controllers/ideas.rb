IdeasBoardApi::App.controllers :ideas do

  get :index, :provides => :json do
    response['Access-Control-Allow-Origin'] = '*'
    response.headers["Allow"] = "HEAD,GET,PUT,DELETE,OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"

    @ideas = Idea.all
    @ideas.to_json
  end

  get :new do
    @idea = Idea.create
    @idea.to_json(:only => [:id, :created_at])
  end

  post :update, :csrf_protection => false, :map => "/idea/update" do
    p params.to_s
    @idea = Idea.where(:uuid => params['id']).first
    if @idea && @idea.update(:title => params['title'], :body => params[:body])
      response['Access-Control-Allow-Origin'] = '*'

      status 200
    else
      status 400
    end
  end

  post :delete, :csrf_protection => false, :map => "/idea/delete" do
    @idea = Idea.where(:uuid => params['id']).first
    if @idea && @idea.destroy
      status 200
    else
      status 400
    end
  end

end
