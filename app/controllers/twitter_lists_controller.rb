class TwitterListsController < ApplicationController
  before_filter :require_user, :only => :index
  # GET /twitter_lists
  # GET /twitter_lists.json
  def index
    @twitter_lists = TwitterList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @twitter_lists }
    end
  end

  # GET /twitter_lists/1
  # GET /twitter_lists/1.json
  def show
    @twitter_list = TwitterList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @twitter_list }
    end
  end

  # GET /twitter_lists/new
  # GET /twitter_lists/new.json
  def new
    @twitter_list = TwitterList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @twitter_list }
    end
  end

  # GET /twitter_lists/1/edit
  def edit
    @twitter_list = TwitterList.find(params[:id])
  end

  # POST /twitter_lists
  # POST /twitter_lists.json
  def create
    @twitter_list = TwitterList.new(params[:twitter_list])

    respond_to do |format|
      if @twitter_list.save
        format.html { redirect_to @twitter_list, notice: 'Twitter list was successfully created.' }
        format.json { render json: @twitter_list, status: :created, location: @twitter_list }
      else
        format.html { render action: "new" }
        format.json { render json: @twitter_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /twitter_lists/1
  # PUT /twitter_lists/1.json
  def update
    @twitter_list = TwitterList.find(params[:id])

    respond_to do |format|
      if @twitter_list.update_attributes(params[:twitter_list])
        format.html { redirect_to @twitter_list, notice: 'Twitter list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @twitter_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitter_lists/1
  # DELETE /twitter_lists/1.json
  def destroy
    @twitter_list = TwitterList.find(params[:id])
    @twitter_list.destroy

    respond_to do |format|
      format.html { redirect_to twitter_lists_url }
      format.json { head :no_content }
    end
  end
end
