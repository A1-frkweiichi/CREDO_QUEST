class AnotherWebsiteLinksController < ApplicationController
  before_action :set_user
  before_action :set_link, only: [:update, :destroy]

  def create
    @link = @user.another_website_links.build(link_params)
    if @link.save
      redirect_to edit_user_path(@user), notice: t("flash.another_website_links.create.success")
    else
      flash.now[:alert] = t("flash.another_website_links.create.failure")
      render "users/edit"
    end
  end

  def update
    if @link.update(link_params)
      redirect_to edit_user_path(@user), notice: t("flash.another_website_links.update.success")
    else
      flash.now[:alert] = t("flash.another_website_links.update.failure")
      render "users/edit"
    end
  end

  def destroy
    if @link.destroy
      redirect_to edit_user_path(@user), notice: t("flash.another_website_links.destroy.success")
    else
      flash.now[:alert] = t("flash.another_website_links.destroy.failure")
      render "users/edit"
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_link
    @link = @user.another_website_links.find(params[:id])
  end

  def link_params
    params.require(:another_website_link).permit(:website, :url)
  end
end
