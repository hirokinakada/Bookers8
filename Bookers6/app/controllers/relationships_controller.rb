class RelationshipsController < ApplicationController

def follows
	@users = User.find(params[:user_id]).following_user
end

def followers
	@users = User.find(params[:user_id]).follower_user
end

def follow
	current_user.follow(params[:id])
	redirect_back(fallback_location: users_path)
end

def unfollow
	current_user.unfollow(params[:id])
	redirect_back(fallback_location: users_path)
end
end
