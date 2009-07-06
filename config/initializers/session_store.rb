# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kill-or-cure_session',
  :secret      => '81ad16a9b64e372c5747467e58aafffeaf2332d6d45c1bc01c269125404ff60c6b576fbe4c40de7a21316aff81139d1684f1a4eb57a99c77a78069736cec8b23'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
