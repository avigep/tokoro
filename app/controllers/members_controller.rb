class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  def index
    @members = User.paginate(page: params[:page])
  end

  # GET /members/1 or /members/1.json
  def show
  end

  private

  def set_member
    @member = User.find(params[:id])
  end
end
