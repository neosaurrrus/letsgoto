class Helpers
    def self.current_user(session_hash) #check who current user is
        User.find_by(id: session_hash[:user_id])
    end

    def self.is_logged_in?(session_hash) # check if someone is logged in.
        !!session_hash[:user_id]
    end
end