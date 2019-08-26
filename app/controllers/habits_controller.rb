class HabitsController < ApplicationController
  def index
    @habits = Habit.all

    render("habit_templates/index.html.erb")
  end

  def show
    @habit = Habit.find(params.fetch("id_to_display"))

    render("habit_templates/show.html.erb")
  end

  def new_form
    @habit = Habit.new

    render("habit_templates/new_form.html.erb")
  end

  def create_row
    @habit = Habit.new

    @habit.habit_name = params.fetch("habit_name")
    @habit.user_id = params.fetch("user_id")
    @habit.actively_tracking = params.fetch("actively_tracking")

    if @habit.valid?
      @habit.save

      redirect_back(:fallback_location => "/habits", :notice => "Habit created successfully.")
    else
      render("habit_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @habit = Habit.find(params.fetch("prefill_with_id"))

    render("habit_templates/edit_form.html.erb")
  end

  def update_row
    @habit = Habit.find(params.fetch("id_to_modify"))

    @habit.habit_name = params.fetch("habit_name")
    @habit.user_id = params.fetch("user_id")
    @habit.actively_tracking = params.fetch("actively_tracking")

    if @habit.valid?
      @habit.save

      redirect_to("/habits/#{@habit.id}", :notice => "Habit updated successfully.")
    else
      render("habit_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @habit = Habit.find(params.fetch("id_to_remove"))

    @habit.destroy

    redirect_to("/habits", :notice => "Habit deleted successfully.")
  end
end
