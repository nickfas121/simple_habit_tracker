class CompletionsController < ApplicationController
  def index
    @completions = Completion.all

    render("completion_templates/index.html.erb")
  end

  def show
    @completion = Completion.find(params.fetch("id_to_display"))

    render("completion_templates/show.html.erb")
  end

  def new_form
    @completion = Completion.new

    render("completion_templates/new_form.html.erb")
  end

  def create_row
    @completion = Completion.new

    @completion.habit_id = params.fetch("habit_id")
    @completion.user_id = params.fetch("user_id")

    if @completion.valid?
      @completion.save

      redirect_back(:fallback_location => "/completions", :notice => "Completion created successfully.")
    else
      render("completion_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_habit
    @completion = Completion.new

    @completion.habit_id = params.fetch("habit_id")
    @completion.user_id = params.fetch("user_id")

    if @completion.valid?
      @completion.save

      redirect_to("/habits/#{@completion.habit_id}", notice: "Completion created successfully.")
    else
      render("completion_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @completion = Completion.find(params.fetch("prefill_with_id"))

    render("completion_templates/edit_form.html.erb")
  end

  def update_row
    @completion = Completion.find(params.fetch("id_to_modify"))

    @completion.habit_id = params.fetch("habit_id")
    @completion.user_id = params.fetch("user_id")

    if @completion.valid?
      @completion.save

      redirect_to("/completions/#{@completion.id}", :notice => "Completion updated successfully.")
    else
      render("completion_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @completion = Completion.find(params.fetch("id_to_remove"))

    @completion.destroy

    redirect_to("/users/#{@completion.user_id}", notice: "Completion deleted successfully.")
  end

  def destroy_row_from_habit
    @completion = Completion.find(params.fetch("id_to_remove"))

    @completion.destroy

    redirect_to("/habits/#{@completion.habit_id}", notice: "Completion deleted successfully.")
  end

  def destroy_row
    @completion = Completion.find(params.fetch("id_to_remove"))

    @completion.destroy

    redirect_to("/completions", :notice => "Completion deleted successfully.")
  end
end
