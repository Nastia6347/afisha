class MainController < ApplicationController
def change_town

	@branch = nil
		BRANCHES.each do |branch|
			if branch[:branch_id]==params[:branch_id].to_i
				@branch = branch
			end
		end
		if @branch.nil?
			session[:branch_id] = params[:branch_id].to_i
		else
			session[:branch_id] = @branch[:branch_id].to_i
		end

redirect_to "/"
end
end
