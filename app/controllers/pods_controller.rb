class PodsController < ApplicationController
  # GET /pods
  # GET /pods.json
  def index
    @pods = Pod.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pods }
    end
  end

  # GET /pods/1
  # GET /pods/1.json
  def show
    @pod = Pod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pod }
    end
  end

  # GET /pods/new
  # GET /pods/new.json
  def new
    @pod = Pod.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pod }
    end
  end

  # GET /pods/1/edit
  def edit
    @pod = Pod.find(params[:id])
  end

  # POST /pods
  # POST /pods.json
  def create
    @pod = Pod.new(params[:pod])

    respond_to do |format|
      if @pod.save
        format.html { redirect_to @pod, notice: 'Pod was successfully created.' }
        format.json { render json: @pod, status: :created, location: @pod }
      else
        format.html { render action: "new" }
        format.json { render json: @pod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pods/1
  # PUT /pods/1.json
  def update
    @pod = Pod.find(params[:id])

    respond_to do |format|
      if @pod.update_attributes(params[:pod])
        format.html { redirect_to @pod, notice: 'Pod was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pods/1
  # DELETE /pods/1.json
  def destroy
    @pod = Pod.find(params[:id])
    @pod.destroy

    respond_to do |format|
      format.html { redirect_to pods_url }
      format.json { head :no_content }
    end
  end
end
