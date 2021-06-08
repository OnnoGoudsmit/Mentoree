class MeetingsController < ApplicationController
  def index
    @meetings = policy_scope(Meeting)
  end
end
