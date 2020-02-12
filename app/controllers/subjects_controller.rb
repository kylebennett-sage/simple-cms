class SubjectsController < ApplicationController
  layout "admin"

  before_action :confirm_logged_in

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find_by_id(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      flash[:notice] = "Subject '#{@subject.name}' created successfully"
      redirect_to(action: "index")
    else
      @subject_count = Subject.count + 1
      render("new")
    end
  end

  def edit
    @subject = Subject.find_by_id(params[:id])
    @subject_count = Subject.count
  end

  def update
    @subject = Subject.find_by_id(params[:id])

    if @subject.update(subject_params)
      flash[:notice] = "Subject '#{@subject.name}' updated successfully"
      redirect_to(action: "show", id: @subject.id)
    else
      @subject_count = Subject.count
      render("edit")
    end
  end

  def delete
    @subject = Subject.find_by_id(params[:id])
  end

  def destroy
    subject = Subject.find_by_id(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' deleted"
    redirect_to(action: "index")
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
