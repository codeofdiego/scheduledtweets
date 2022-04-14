class TwitterAccountsController < ApplicationController
    before_action :require_user_logged_in!
    def index
        @twitter_accounts = Current.user.twitter_accounts
    end

    def destroy
        @twitter_accounts = Current.user.twitter_accounts.find_by(params[:id])
        @twitter_accounts.destroy
        redirect_to twitter_accounts_path, notice: "Account disconnected."
    end
end