class Study::ChaseController < ApplicationController
  
  def index
    if current_user.is?(:typer) 
      redirect_to root_path
    end
    @activity = []
    User.all.each do |user|
      if user.is?(:typer) or user.is?(:supertyper)
        @activity.push({user: user, subjects: user.subjects.all.count,
        marks: user.marks.all.count})
      end
    end
  end

end