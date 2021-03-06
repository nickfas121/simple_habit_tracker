Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "habits#index"
  # Routes for the Completion resource:

  # CREATE
  get("/completions/new", { :controller => "completions", :action => "new_form" })
  post("/create_completion", { :controller => "completions", :action => "create_row" })
  post("/create_completion_from_habit", { :controller => "completions", :action => "create_row_from_habit" })

  # READ
  get("/completions", { :controller => "completions", :action => "index" })
  get("/completions/:id_to_display", { :controller => "completions", :action => "show" })

  # UPDATE
  get("/completions/:prefill_with_id/edit", { :controller => "completions", :action => "edit_form" })
  post("/update_completion/:id_to_modify", { :controller => "completions", :action => "update_row" })

  # DELETE
  get("/delete_completion/:id_to_remove", { :controller => "completions", :action => "destroy_row" })
  get("/delete_completion_from_habit/:id_to_remove", { :controller => "completions", :action => "destroy_row_from_habit" })
  get("/delete_completion_from_user/:id_to_remove", { :controller => "completions", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Habit resource:

  # CREATE
  get("/habits/new", { :controller => "habits", :action => "new_form" })
  post("/create_habit", { :controller => "habits", :action => "create_row" })

  # READ
  get("/habits", { :controller => "habits", :action => "index" })
  get("/habits/:id_to_display", { :controller => "habits", :action => "show" })

  # UPDATE
  get("/habits/:prefill_with_id/edit", { :controller => "habits", :action => "edit_form" })
  post("/update_habit/:id_to_modify", { :controller => "habits", :action => "update_row" })

  # DELETE
  get("/delete_habit/:id_to_remove", { :controller => "habits", :action => "destroy_row" })
  get("/delete_habit_from_user/:id_to_remove", { :controller => "habits", :action => "destroy_row_from_user" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
