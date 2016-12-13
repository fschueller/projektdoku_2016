class ExternaltoolsController < ApplicationController
  def index
    @tools = current_user.externaltools.all
    @tools.each do |tool|
      if tool.type == "Github"
        if tool.repo_access
          flash[:access] = "Already proudly showing off membership of SUSE org on Github! Kudos!"
        else
          flash[:access] = "You possibly don't show your public organization membership on one of your GitHub profiles. If you don't have access, "\
            "#{ view_context.mail_to 'github-owners@suse.de', 'send us your request.', subject: 'Requesting membership to SUSE Employees Team on Github', body: 'Dear github-owners, please add my account %{github_alias} to the SUSE Organization and the SUSE Employees Team on Github. Thanks!' % { github_alias: tool.alias }}".html_safe
        end
      end
    end

    @current_manager = Manager.find_manager(current_user.username) unless Rails.env.test?
  end

  def new
    @tool = current_user.externaltools.new
    @current_manager = Manager.find_manager(current_user.username) unless Rails.env.test?
    render :index
  end

  def create
    @tool = current_user.externaltools.new(tool_params)
    if @tool.save
      GithubPublicAccessJob.perform_later(@tool.id) unless @tool.type == "Trello" || Rails.env.test?
      flash[:notice] = "Success! Tool #{@tool.type} has been added. Checking access... #{undo_link}"
    else
      flash[:error] = "Something went wrong. Check if you entered a valid username (e.g. not the email address you log in with, an '@' in your alias or whitespace)."
    end
    redirect_to action: :index
  end

  def destroy
    @tool = current_user.externaltools.find(params[:id])
    @tool.destroy!
    flash[:notice] = "Tool #{@tool.type} deleted from user record. #{undo_link}"
    redirect_to action: :index
  end

  protected
    def tool_params
      params.require(:externaltool).permit(:type, :alias)
    end

  private
    def undo_link
      view_context.link_to("Undo this please", revert_version_path(@tool.versions.last), method: :post)
    end
end
