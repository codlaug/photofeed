class TwitterMembersController < ApplicationController
  # GET /twitter_members
  # GET /twitter_members.json
  def index
    @twitter_members = TwitterMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @twitter_members }
    end
  end

  # GET /twitter_members/1
  # GET /twitter_members/1.json
  def show
    @twitter_member = TwitterMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @twitter_member }
    end
  end

  # GET /twitter_members/new
  # GET /twitter_members/new.json
  def new
    @twitter_member = TwitterMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @twitter_member }
    end
  end

  # GET /twitter_members/1/edit
  def edit
    @twitter_member = TwitterMember.find(params[:id])
  end

  # POST /twitter_members
  # POST /twitter_members.json
  def create
    @twitter_member = TwitterMember.new(params[:twitter_member])

    respond_to do |format|
      if @twitter_member.save
        format.html { redirect_to @twitter_member, notice: 'Twitter member was successfully created.' }
        format.json { render json: @twitter_member, status: :created, location: @twitter_member }
      else
        format.html { render action: "new" }
        format.json { render json: @twitter_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /twitter_members/1
  # PUT /twitter_members/1.json
  def update
    @twitter_member = TwitterMember.find(params[:id])

    respond_to do |format|
      if @twitter_member.update_attributes(params[:twitter_member])
        format.html { redirect_to @twitter_member, notice: 'Twitter member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @twitter_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitter_members/1
  # DELETE /twitter_members/1.json
  def destroy
    @twitter_member = TwitterMember.find(params[:id])
    @twitter_member.destroy

    respond_to do |format|
      format.html { redirect_to twitter_members_url }
      format.json { head :no_content }
    end
  end
end
